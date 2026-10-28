#version 450
// One triangle covering the viewport; the viewport is the aspect-fit rectangle.
layout(location = 0) out vec2 uv;

void main() {
    vec2 corner = vec2((gl_VertexIndex << 1) & 2, gl_VertexIndex & 2);
    uv = corner;
    gl_Position = vec4(corner * 2.0 - 1.0, 0.0, 1.0);
}
