//
//  HomeView.swift
//  PlanetApp
//
//  Created by Sevcan Eşim on 28.01.2024.
//

import SwiftUI

struct HomeView: View {
    
    @State var searchText = ""
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1
        let x = proxy.frame(in: .global).minX
        let diff = x - 32
        if diff < 100 {
            scale = 1 + diff / 500
        }
        return scale
    }

    struct DataModel: Identifiable {
          let id: String
        let name: String
        let imageName: String
        }

        let data: [DataModel] = [
        .init(id: "0", name: "SteveJobs", imageName: "SteveJobs"),
        .init(id: "1", name: "Satya Nadella", imageName: "Satya Nadella"),
        .init(id: "2", name: "Jeff Bezos", imageName: "Jeff Bezos"),
        .init(id: "3", name: "Tim Cook", imageName: "Tim Cook")
        ]
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
                        NavigationLink {
                            PaywallView()
                        } label: {
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
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 16) {
                            ForEach(0..<5) { num in
                                ZStack {
                                    GeometryReader { proxy in
                                        NavigationLink {
                                            Text("")
                                        } label: {
                                            let scale = getScale(proxy: proxy)
                                            Image("background-card")
                                                .resizable()
                                                .scaledToFill()
                                                .scaleEffect(CGSize(width: scale, height: scale))
                                        }
                                    }
                                    .background(.clear)
                                    .frame(width: 280, height: 200)

                                    ZStack {
                                        Text("How to identify plants easily \n with PlantApp?")
                                            .lineLimit(2)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.leading)
                                            .foregroundColor(.white)
                                            .frame(maxHeight: .infinity, alignment: .bottom)
                                            .padding()
                                    }

                                }

                                
                            }
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    ScrollView() {
                        ForEach(data) { items in
                            HStack {
                                ForEach(0..<2) { items in
                                    NavigationLink {
                                        Text("")
                                    } label: {
                                        ZStack {
                                            Image("background-category")
                                                .resizable()
                                                .frame(width: 150, height: 150)
                                                .foregroundColor(.yellow)
                                                .shadow(radius: 1)
                                            Text("category")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                                .frame(maxHeight: .infinity, alignment: .topLeading)
                                                .foregroundColor(.black)

                                            Spacer()
                                        }

                                    }
                                }.padding(.bottom, 16)
                            }
                            
                            HStack {
                                Spacer()
                            }
                        }
                    }
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
