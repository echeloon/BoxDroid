#version 450

//============================================================================================================
//
//
//                  Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
//                              SPDX-License-Identifier: BSD-3-Clause
//
//============================================================================================================
//
// Snapdragon Game Super Resolution 1 (sgsr/v1/include/glsl/sgsr1_shader_mobile.frag from
// https://github.com/SnapdragonStudios/snapdragon-gsr, commit d926f074), licensed under the
// BSD 3-Clause License in LICENSE.sgsr next to this file. BoxDroid's changes, for Vulkan GLSL:
// - #version 450; ViewportInfo is a push constant and the sampler is set 0, binding 0;
// - the texture coordinate is a vec2 from shaders/present.vert;
// - mode is a const, as GLSL 4.50 requires for textureGather's component, and the
//   constructors in the gather offsets drop their precision qualifiers.
// The upscaling algorithm and its configuration are unchanged.
//
//============================================================================================================

precision mediump float;
precision highp int;

////////////////////////
// USER CONFIGURATION //
////////////////////////

/*
* Operation modes:
* RGBA -> 1
* RGBY -> 3
* LERP -> 4
*/
#define OperationMode 1

#define EdgeThreshold 8.0/255.0

#define EdgeSharpness 2.0

// #define UseUniformBlock

////////////////////////
////////////////////////
////////////////////////

// ViewportInfo[0]: 1 / input width, 1 / input height, input width, input height.
layout(push_constant) uniform PushConstants
{
	highp vec4 ViewportInfo[1];
};
layout(set = 0, binding = 0) uniform mediump sampler2D ps0;

layout(location=0) in highp vec2 in_TEXCOORD0;
layout(location=0) out vec4 out_Target0;

float fastLanczos2(float x)
{
	float wA = x-4.0;
	float wB = x*wA-wA;
	wA *= wA;
	return wB*wA;
}
vec2 weightY(float dx, float dy,float c, float std)
{
	float x = ((dx*dx)+(dy* dy))* 0.55 + clamp(abs(c)*std, 0.0, 1.0);
	float w = fastLanczos2(x);
	return vec2(w, w * c);	
}

void main()
{
	const int mode = OperationMode;
	float edgeThreshold = EdgeThreshold;
	float edgeSharpness = EdgeSharpness;

	vec4 color;
	if(mode == 1)
		color.xyz = textureLod(ps0,in_TEXCOORD0.xy,0.0).xyz;
	else
		color.xyzw = textureLod(ps0,in_TEXCOORD0.xy,0.0).xyzw;

	highp float xCenter;
	xCenter = abs(in_TEXCOORD0.x+-0.5);
	highp float yCenter;
	yCenter = abs(in_TEXCOORD0.y+-0.5);

	//todo: config the SR region based on needs
	//if ( mode!=4 && xCenter*xCenter+yCenter*yCenter<=0.4 * 0.4)
	if ( mode!=4)
	{
		highp vec2 imgCoord = ((in_TEXCOORD0.xy*ViewportInfo[0].zw)+vec2(-0.5,0.5));
		highp vec2 imgCoordPixel = floor(imgCoord);
		highp vec2 coord = (imgCoordPixel*ViewportInfo[0].xy);
		vec2 pl = (imgCoord+(-imgCoordPixel));
		vec4  left = textureGather(ps0,coord, mode);

		float edgeVote = abs(left.z - left.y) + abs(color[mode] - left.y)  + abs(color[mode] - left.z) ;
		if(edgeVote > edgeThreshold)
		{
			coord.x += ViewportInfo[0].x;

			vec4 right = textureGather(ps0,coord + vec2(ViewportInfo[0].x, 0.0), mode);
			vec4 upDown;
			upDown.xy = textureGather(ps0,coord + vec2(0.0, -ViewportInfo[0].y),mode).wz;
			upDown.zw  = textureGather(ps0,coord+ vec2(0.0, ViewportInfo[0].y), mode).yx;

			float mean = (left.y+left.z+right.x+right.w)*0.25;
			left = left - vec4(mean);
			right = right - vec4(mean);
			upDown = upDown - vec4(mean);
			color.w =color[mode] - mean;

			float sum = (((((abs(left.x)+abs(left.y))+abs(left.z))+abs(left.w))+(((abs(right.x)+abs(right.y))+abs(right.z))+abs(right.w)))+(((abs(upDown.x)+abs(upDown.y))+abs(upDown.z))+abs(upDown.w)));				
			float std = 2.181818/sum;
			
			vec2 aWY = weightY(pl.x, pl.y+1.0, upDown.x,std);				
			aWY += weightY(pl.x-1.0, pl.y+1.0, upDown.y,std);
			aWY += weightY(pl.x-1.0, pl.y-2.0, upDown.z,std);
			aWY += weightY(pl.x, pl.y-2.0, upDown.w,std);			
			aWY += weightY(pl.x+1.0, pl.y-1.0, left.x,std);
			aWY += weightY(pl.x, pl.y-1.0, left.y,std);
			aWY += weightY(pl.x, pl.y, left.z,std);
			aWY += weightY(pl.x+1.0, pl.y, left.w,std);
			aWY += weightY(pl.x-1.0, pl.y-1.0, right.x,std);
			aWY += weightY(pl.x-2.0, pl.y-1.0, right.y,std);
			aWY += weightY(pl.x-2.0, pl.y, right.z,std);
			aWY += weightY(pl.x-1.0, pl.y, right.w,std);

			float finalY = aWY.y/aWY.x;

			float maxY = max(max(left.y,left.z),max(right.x,right.w));
			float minY = min(min(left.y,left.z),min(right.x,right.w));
			finalY = clamp(edgeSharpness*finalY, minY, maxY);
					
			float deltaY = finalY -color.w;	
			
			//smooth high contrast input
			deltaY = clamp(deltaY, -23.0 / 255.0, 23.0 / 255.0);

			color.x = clamp((color.x+deltaY),0.0,1.0);
			color.y = clamp((color.y+deltaY),0.0,1.0);
			color.z = clamp((color.z+deltaY),0.0,1.0);
		}
	}

	color.w = 1.0;  //assume alpha channel is not used
	out_Target0.xyzw = color;
}