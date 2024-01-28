//
//  GetStartedView.swift
//  PlanetApp
//
//  Created by Sevcan Eşim on 28.01.2024.
//

import SwiftUI

struct GetStartedPageView: View {
    let imageName: String
    let titleLight1: String
    let titleLight2: String
    let titleBold: String
    let description: String

    var nextAction: () -> Void

    var body: some View {
        VStack() {
            HStack() {
                Text(titleLight1)
                    .font(.custom("Rubik-VariableFont_wght", size: 24))
                    .fontWeight(.medium)
                Text(titleBold)
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding(.vertical, 10)

            Text(titleLight2)
                .font(.body)
                .fontWeight(.ultraLight)
            
            Image(imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: 530)

            Button("Get Started") {
                nextAction()
            }
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.green)
            .cornerRadius(8)
            
            Text(description)
                .multilineTextAlignment(.center)
                .font(.footnote)
                .fontWeight(.ultraLight)
                .padding(.horizontal, 40)
            
        }
        .background(
            Image("background")
                .resizable()
                .frame(width: .infinity, height:.infinity)
        )
        .padding(.horizontal, 20)
    }
}

struct GetStartedPageView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView(showGetStarted: .constant(true))
    }
}

