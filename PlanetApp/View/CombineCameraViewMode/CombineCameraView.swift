//
//  CombineCameraView.swift
//  PlanetApp
//
//  Created by Sevcan Eşim on 28.01.2024.
//

import SwiftUI

struct CombineCameraView: View {

    @StateObject var viewModel = CombineCameraViewModel()

    var body: some View {
        ZStack {
            CameraFrameView(image: viewModel.frame)
                .ignoresSafeArea()

            ErrorView(error: viewModel.error)

            filters
        }
        .onAppear {
            CameraManager.shared.controllSession(start: true)
        }
        .onDisappear {
            CameraManager.shared.controllSession(start: false)
        }
    }
}

extension CombineCameraView {
    var filters: some View {
        VStack {
            Spacer()
            HStack {
                ToggleButton(selected: $viewModel.comicFilter, label: "🤣")
                ToggleButton(selected: $viewModel.monoFilter, label: "🌚")
                ToggleButton(selected: $viewModel.crystalFilter, label: "🔮")
            }
            .padding()
        }
    }
}

struct CombineCameraView_Previews: PreviewProvider {
    static var previews: some View {
        CombineCameraView()
    }
}
