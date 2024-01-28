//
//  AVCameraView.swift
//  PlanetApp
//
//  Created by Sevcan Eşim on 28.01.2024.
//

import SwiftUI

struct AVCameraView: View {
    var body: some View {
        ZStack {
            CameraPreviewHolder(captureSession: CameraManager.shared.session)
                .ignoresSafeArea()
        }
        .onAppear {
            CameraManager.shared.controllSession(start: true)
        }
        .onDisappear {
            CameraManager.shared.controllSession(start: false)
        }
    }
}

struct AVCameraView_Previews: PreviewProvider {
    static var previews: some View {
        AVCameraView()
    }
}
