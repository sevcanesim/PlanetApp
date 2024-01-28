//
//  PaywallView.swift
//  PlanetApp
//
//  Created by Sevcan Eşim on 28.01.2024.
//

import SwiftUI

struct PaywallView: View {
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1
        let x = proxy.frame(in: .global).minX
        let diff = x - 32
        if diff < 100 {
            scale = 1 + diff / 500
        }
        return scale
    }

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        NavigationView {
            ZStack {
                Spacer()
                Image("background-premium")
                    .resizable()
                    .scaledToFill()
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .bottom)

                VStack(alignment: .leading) {
                    Spacer()
                    VStack(alignment: .leading) {
                        HStack() {
                            Text("PlanetApp")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("Premium")
                                .font(.headline)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                        }
                        Text("Access All Features")
                            .font(.headline)
                            .fontWeight(.ultraLight)
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 20)

                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(0..<5) { num in
                                GeometryReader { proxy in
                                    NavigationLink {
                                        Text("")
                                    } label: {
                                        VStack(alignment: .leading) {
                                            Image("scanner")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 24)
                                                .foregroundColor(.gray)
                                            Spacer()
                                            Text("Unlimited")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                                .foregroundStyle(.white)
                                            Text("Plant Identify")
                                                .font(.subheadline)
                                                .fontWeight(.ultraLight)
                                                .foregroundStyle(.white)
                                            Spacer()
                                        }
                                        .padding()
                                    }
                                }
                                .background(Color.backgroundBox)
                                .frame(width: 130, height: 130)

                            }
                        }
                    }
                    .padding()

                    VStack(alignment: .leading) {
                        Button(action: {}, label: {
                            HStack {
                                Image("inactive")
                                VStack(alignment: .leading) {
                                    Text("1 Month")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.leading)
                                    Text("$2.99/month, auto renewable")
                                        .font(.subheadline)
                                        .fontWeight(.light)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                Spacer()
                            }
                        })
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .padding()
                        .background(Color.backgroundBox)
                        .border(Color.accentColor)
                        .cornerRadius(8)
                        .padding(.horizontal, 10)
                        Button(action: {}, label: {
                            HStack {
                                Image("inactive")
                                VStack(alignment: .leading) {
                                    Text("1 Year")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Text("First 3 days free, then $529,99/year")
                                        .font(.subheadline)
                                        .fontWeight(.light)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                Spacer()
                            }
                        })
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .padding()
                        .background(Color.backgroundBox)
                        .border(Color.accentColor)
                        .cornerRadius(8)
                        .padding(.horizontal, 10)

                        Button("Try free for 3 days") {
                        }
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(8)
                        .padding()

                        Text("After the 3-day free trial period you’ll be charged ₺274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable")
                            .font(.system(size: 12))
                            .fontWeight(.ultraLight)
                            .foregroundStyle(.gray)
                            .padding()
                    }
                    .background(Color.premiumBackground)
                }
                Spacer()
            }
        }
    }
}


struct PaywallView_Previews: PreviewProvider {
    static var previews: some View {
        PaywallView()
    }
}

