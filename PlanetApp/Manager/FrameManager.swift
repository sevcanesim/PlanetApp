//
//  FrameManager.swift
//  PlanetApp
//
//  Created by Sevcan Eşim on 28.01.2024.
//

import AVFoundation

class FrameManager: NSObject, ObservableObject {

    static let shared = FrameManager()

    @Published var current: CVPixelBuffer?

    let videoOutputQueue = DispatchQueue(label: "com.sevcanesim.VideoOutPutQ",
                                         qos: .userInitiated,
                                         attributes: [],
                                         autoreleaseFrequency: .workItem)

    private override init() {
        super.init()
        CameraManager.shared.set(self, queue: videoOutputQueue)
    }
}

extension FrameManager: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(
        _ output: AVCaptureOutput,
        didOutput sampleBuffer: CMSampleBuffer,
        from connection: AVCaptureConnection
    ) {
        if let buffer = sampleBuffer.imageBuffer {
            DispatchQueue.main.async {
                self.current = buffer
            }
        }
    }
}
