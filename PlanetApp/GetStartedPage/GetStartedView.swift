//
//  GetStartedView.swift
//  PlanetApp
//
//  Created by Sevcan Eşim on 28.01.2024.
//

import SwiftUI

struct GetStartedView: View {
    
    @Binding var showGetStarted: Bool
    @State private var showOnboarding: Bool = true
    
    var body: some View {
        GetStartedPageView(
            imageName: "getStarted-image",
            titleLight1: "Welcome to",
            titleLight2: "Identify more than 3000+ plants and 88% accuracy.",
            titleBold: "PlantApp", 
            description: "By tapping next, you are agreeing to PlantID Terms of Use & Privacy Policy.",
            nextAction: goNext
        )
    }
    
    func goNext() {
        showOnboarding = true
    }
}

struct GetStartedViewPreviews: PreviewProvider {
    static var previews: some View {
        GetStartedView(showGetStarted: .constant(true))
    }
}



