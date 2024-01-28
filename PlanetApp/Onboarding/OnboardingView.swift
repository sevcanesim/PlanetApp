//
//  OnboardingView.swift
//  PlanetApp
//
//  Created by Sevcan Eşim on 28.01.2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var showOnboarding: Bool
    @State private var showGetStarted: Bool = true
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            OnboardingPageView(
                imageName: "onboarding-1",
                titleLight1: "Take a photo to",
                titleLight2: "the plant!",
                titleBold: "identify",
                brush: "brush",
                showDoneButton: false,
                nextAction: goNext
            )
            .tag(0)

            OnboardingPageView(
                imageName: "onboarding-2",
                titleLight1: "Get plant",
                titleLight2: " ",
                titleBold: "care guides",
                brush: "brush",
                showDoneButton: false,
                nextAction: goNext
            )
            .tag(1)
            OnboardingPageView(
                imageName: "onboarding-2",
                titleLight1: "Get plant",
                titleLight2: " ",
                titleBold: "care guides",
                brush: "brush",
                showDoneButton: false,
                nextAction: goNext
            )
            .tag(2)
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
    
    func goNext() {
        if selection < 2 {
            withAnimation {
                selection += 1
            }
        } else {
            showOnboarding = false
        }
    }
}

struct OnboardingViewPreviews: PreviewProvider {
    static var previews: some View {
        OnboardingView(showOnboarding: .constant(true))
    }
}

