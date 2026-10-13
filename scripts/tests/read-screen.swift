import Foundation
import Vision
import CoreImage
import ImageIO
let url = URL(fileURLWithPath: CommandLine.arguments[1])
let request = VNRecognizeTextRequest()
request.recognitionLevel = .accurate
request.usesLanguageCorrection = false
let timer = CommandLine.arguments.contains("--sega-timer")
let source = CIImage(contentsOf: url)!
let input = timer ? source.cropped(to: CGRect(
    x: source.extent.width * 0.16, y: source.extent.height * 0.045,
    width: source.extent.width * 0.27, height: source.extent.height * 0.16)) : source
let cgInput = CIContext().createCGImage(input, from: input.extent)!
try VNImageRequestHandler(cgImage: cgInput).perform([request])
for line in request.results ?? [] { if let text = line.topCandidates(1).first?.string { print(text) } }
// Mission briefing prompts are very dark. Read a brightened copy as well.
if !timer, let image = CIImage(contentsOf: url) {
    let bright = image.applyingFilter("CIExposureAdjust", parameters: ["inputEV": 3])
    if let cg = CIContext().createCGImage(bright, from: bright.extent) {
        try VNImageRequestHandler(cgImage: cg).perform([request])
        for line in request.results ?? [] {
            if let text = line.topCandidates(1).first?.string { print(text) }
        }
    }
}
