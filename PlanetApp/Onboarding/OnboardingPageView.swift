//
//  OnboardingPageView.swift
//  PlanetApp
//
//  Created by Sevcan Eşim on 28.01.2024.
//

import SwiftUI

struct OnboardingPageView: View {
    let imageName: String
    let titleLight1: String
    let titleLight2: String
    let titleBold: String
    let brush: String

    let showDoneButton: Bool

    var nextAction: () -> Void

    var body: some View {
        VStack(spacing: 10) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(titleLight1)
                        .font(.title)
                        .fontWeight(.medium)
                        .frame(maxHeight: .infinity)
                    Text(titleLight2)
                        .font(.title)
                        .fontWeight(.medium)
                        .frame(maxHeight: .infinity)
                }

                VStack(spacing: 1) {
                    Text(titleBold)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxHeight: .infinity)
                    Image(brush)
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                        .foregroundColor(.mint)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 50)
            
            VStack {
                Image(imageName)
                    .renderingMode(.original)
                    .resizable()
                    .clipped()
                    .scaledToFit()
                    .frame(width: 370, height: 530)

                Button("Continue") {
                    nextAction()
                }
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.green)
                .cornerRadius(8)
            }
        }
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
        .padding(.horizontal, 20)
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(
            imageName: "onboarding-1",
            titleLight1: "Home",
            titleLight2: "Home",
            titleBold: "Home",
            brush: "brush",
            showDoneButton: true) {
                print("aa")
            }
    }
}

