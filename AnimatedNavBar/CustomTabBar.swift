//
//  ContentView.swift
//  AnimatedNavBar
//
//  Created by Nicolas Cobelo on 25/05/2021.
//

import SwiftUI

struct CustomTabBar: View {
    
    @State var selectedIndex = 0
    @State var isNavBarHidden = false
    
    var body: some View {
        VStack {
            
            // Content
            ZStack {
                
                
                switch selectedIndex {
                case 0:
                    NavigationView {
                        VStack {
                            Text("First Screen")
                        }
                        .navigationTitle("Home")
                    }
                case 1:
                    NavigationView {
                        VStack {
                            Text("First Screen")
                        }
                        .navigationTitle("Settings")
                    }
                case 3:
                    NavigationView {
                        VStack {
                            Text("First Screen")
                        }
                        .navigationTitle("Edit")
                    }
                case 4:
                    NavigationView {
                        VStack {
                            Text("First Screen")
                        }
                        .navigationTitle("Message")
                    }
                case 5:
                    NavigationView {
                        VStack {
                            Text("First Screen")
                        }
                        .navigationTitle("Camera")
                    }
                case 6:
                    NavigationView {
                        VStack {
                            Text("First Screen")
                        }
                        .navigationTitle("Video")
                    }
                case 7:
                    NavigationView {
                        VStack {
                            Text("First Screen")
                        }
                        .navigationTitle("Audio")
                    }
                default:
                    NavigationView {
                        VStack {
                            Text("First Screen")
                        }
                        .navigationTitle("Profile")
                    }
                }
            }
            .blur(radius: isNavBarHidden ? 3 : 0)
//            .overlay(isNavBarHidden ? Color.gray.opacity(0.3) : Color.clear)
            
            ZStack {
                VStack(spacing: 10) {
                    Divider()
                    
                    CustomNavBar2(selectedIndex: $selectedIndex)
                }
                .offset(x: 0, y: isNavBarHidden ? 100 : 0)
                
                ExtraButton(isNavBarHidden: $isNavBarHidden, selectedIndex: $selectedIndex, icon: "camera", indexValue: 5)
                    .offset(x: isNavBarHidden ? -130 : 0,
                            y: isNavBarHidden ? -50 : 0)
                ExtraButton(isNavBarHidden: $isNavBarHidden, selectedIndex: $selectedIndex, icon: "video", indexValue: 6)
                    .offset(x: isNavBarHidden ? -55 : 0,
                            y: isNavBarHidden ? -70 : 0)
                ExtraButton(isNavBarHidden: $isNavBarHidden, selectedIndex: $selectedIndex, icon: "mic", indexValue: 7)
                    .offset(x: isNavBarHidden ? 55 : 0,
                            y: isNavBarHidden ? -70 : 0)
                ExtraButton(isNavBarHidden: $isNavBarHidden, selectedIndex: $selectedIndex, icon: "person", indexValue: 8)
                    .offset(x: isNavBarHidden ? 130 : 0,
                            y: isNavBarHidden ? -50 : 0)
                PlusButton(isNavBarHidden: $isNavBarHidden)
            }

            
        }
        
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}

struct ExtraButton: View {
    @Binding var isNavBarHidden: Bool
    @Binding var selectedIndex: Int
    let icon: String
    let indexValue: Int
    
    var body: some View {
        Button(action: {
            selectedIndex = indexValue
            withAnimation(.easeOut) {
                isNavBarHidden.toggle()
            }
        }, label: {
            Image(systemName: icon)
                .font(.system(size: 25, weight: .regular, design: .default))
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(Config.Colors.darkBlue)
                .cornerRadius(30)
//                .opacity(isNavBarHidden ? 1 : 0)
        })
            
    }
}

struct CustomNavBar2: View {
    @Binding var selectedIndex: Int
    let icons = [
        "house",
        "gear",
        "plus",
        "lasso",
        "message"
    ]
    
    var body: some View {
        HStack {
            ForEach(0..<5, id: \.self) { number in
                Spacer()
                Button(action: {
                    
                    selectedIndex = number
                    
                }, label: {
                    if number == 2 {
                        EmptyView()
                    }
                    else {
                        Image(systemName: icons[number])
                            .font(.system(size: 25, weight: .regular, design: .default))
                            .foregroundColor(selectedIndex == number ? Color(.label) : Color(.systemGray4))
                    }
                })
                
                Spacer()
            }
        }
    }
}


struct PlusButton: View {
    
    @Binding var isNavBarHidden: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.easeOut) {
                isNavBarHidden.toggle()
            }
        }, label: {
            Image(systemName: "plus")
                .font(.system(size: 25, weight: .regular, design: .default))
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .background(isNavBarHidden ? Color.red : Color.blue)
                .cornerRadius(30)
                .rotationEffect(.degrees(isNavBarHidden ? 45 : 0))
        })
    }
}

