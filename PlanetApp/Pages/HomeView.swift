//
//  HomeView.swift
//  PlanetApp
//
//  Created by Sevcan Eşim on 28.01.2024.
//

import SwiftUI

struct HomeView: View {
    
    @State var searchText = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Hi, plant lover!")
                            .font(.headline)
                            .fontWeight(.light)
                        Text("Good Afternoon! ⛅")
                            .font(.title)
                            .fontWeight(.medium)
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    HStack {
                        Image("search")
                            .renderingMode(.original)
                            .font(.system(size: 26, weight: .bold))
                        TextField("Search for plants ", text: $searchText)
                    }
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(6)
                    .padding(.horizontal)
                }
                .padding()
                .background(
                    Image("background-home")
                        .resizable()
                        .frame(width: .infinity, height:.infinity)
                )
                
                VStack(alignment: .leading) {
                    Button(action: {}, label: {
                        HStack {
                            Image("premium-box")
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("FREE Premium Available")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.darkPremiumBox)
                                Text("Tap to upgrade your account!")
                                    .font(.subheadline)
                                    .fontWeight(.light)
                                    .foregroundColor(Color.lightPremiumBox)
                                Spacer()
                            }
                            Spacer()
                            Image("arrow")
                        }
                    })
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        Image("background-premium-box")
                            .resizable()
                            .frame(width: .infinity, height:.infinity)
                    )
                    .cornerRadius(8)
                    
                    
                    Text("Get Started")
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                
            }
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
