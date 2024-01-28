//
//  ContentView.swift
//  PlanetApp
//
//  Created by Sevcan Eşim on 28.01.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
   // @State private var showGetStarted: Bool = true
    @State private var showOnBoarding: Bool = true
    @State var shouldShowModel = false
    @State var selectedIndex = 0
    

    let tabBarImageNames = ["home", "diagnose", "scan-button", "my-garden", "profile"]
    let tabBarNames = ["Home", "Diagnose", "", "My Garden", "Profile"]
    
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
        UINavigationBar.appearance().barTintColor = .systemBackground
    }
    
    var body: some View {
        VStack {
            ZStack {
                Spacer()
                    .fullScreenCover(isPresented: $shouldShowModel, content: {
                        Button(action: {shouldShowModel.toggle()}, label: {
                            CameraView()
                        })
                    })

                switch selectedIndex {
                case 0:
                    HomeView()
                case 1:
                    NavigationView {
                        ScrollView {
                            ForEach(0..<100) { num in
                                Text("\(num)")
                            }
                        }
                        .navigationTitle("Second Tab")
                    }
                    
                default:
                    NavigationView {
                        Text("Remaining tabs")
                    }
                }
            }
            Divider()
                .padding(.bottom, 6)
            
            HStack {
                ForEach(0..<5) { num in
                    Button {
                        if num == 2 {
                            shouldShowModel.toggle()
                            return
                        }
                        selectedIndex = num
                    } label: {
                        Spacer()
                        
                        if num == 2 {
                            Image(tabBarImageNames[num])
                                .renderingMode(.original)
                                .font(.system(size: 44, weight: .bold))
                                .tint(selectedIndex == num ? Color.accentColor : Color(.systemGray))
                        } else {
                            VStack(alignment: .center) {
                                Image(tabBarImageNames[num])
                                    .renderingMode(.template)
                                    .font(.system(size: 26, weight: .bold))
                                    .tint(selectedIndex == num ? Color.accentColor : Color(.systemGray))
                                Label(tabBarNames[num], systemImage: tabBarImageNames[num])
                                    .font(.system(size: 8, weight: .regular))
                                    .foregroundColor(selectedIndex == num ? Color.accentColor : Color(.systemGray))
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
        
        /*.fullScreenCover(isPresented: $showGetStarted, content: {
            GetStartedView(showGetStarted: $showGetStarted)
        })*/
        .fullScreenCover(isPresented: $showOnBoarding, content: {
            OnboardingView(showOnboarding: $showOnBoarding)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
