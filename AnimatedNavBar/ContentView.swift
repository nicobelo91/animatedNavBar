//
//  ContentView.swift
//  AnimatedNavBar
//
//  Created by Nicolas Cobelo on 25/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlusSignPressed = false
    @State var index = 0
    
    var body: some View {
        VStack {
            Spacer()
            CustomTabs(isPlusSignPressed: $isPlusSignPressed, index: $index)
        }
        .background(Color(.systemGray6).edgesIgnoringSafeArea(isPlusSignPressed ? .all : .top))
        .animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTabs: View {
    
    @Binding var isPlusSignPressed: Bool
    @Binding var index: Int
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: isPlusSignPressed ? 25 : 0)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                Button(action: {
                    
                    self.index = 0
                    
                }) {
                    Image(systemName: isPlusSignPressed ? Config.Icon.camera : Config.Icon.activities)
                        .font(.system(size: 25.0))
                        .animation(.default)
                }
                .foregroundColor(Color.black.opacity(self.index == 0 ? 1 : 0.2))
            }.offset(x: 0, y: isPlusSignPressed ? -50 : 0)
            .animation(.default)
            
            Spacer(minLength: 0)
            
            ZStack {
                RoundedRectangle(cornerRadius: isPlusSignPressed ? 25 : 0)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                Button(action: {
                    
                    self.index = 1
                    
                }) {
                    Image(systemName: isPlusSignPressed ? Config.Icon.video : Config.Icon.contacts)
                        .font(.system(size: 25.0))
                        .animation(.default)
                }
                .foregroundColor(Color.black.opacity(self.index == 1 ? 1 : 0.2))
            }.offset(x: 10, y: isPlusSignPressed ? -80 : 0)
            .animation(.default)
            
            Spacer(minLength: 0)
            
            Button(action: {
                isPlusSignPressed.toggle()
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 50.0))
                    .rotationEffect(.degrees(isPlusSignPressed ? 45 : 0))
                    .animation(.default)
            }
            .offset(y: -25)
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: isPlusSignPressed ? 25 : 0)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                Button(action: {
                    
                    self.index = 2
                    
                }) {
                    Image(systemName: isPlusSignPressed ? Config.Icon.microphone : Config.Icon.book)
                        .animation(.default)
                        .font(.system(size: 25.0))
                }
                .foregroundColor(Color.black.opacity(self.index == 2 ? 1 : 0.2))
            }.offset(x: -10, y: isPlusSignPressed ? -80 : 0)
            .animation(.default)
            
            Spacer(minLength: 0)
            
            ZStack {
                RoundedRectangle(cornerRadius: isPlusSignPressed ? 25 : 0)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                Button(action: {
                    
                    self.index = 3
                    
                }) {
                    Image(systemName: isPlusSignPressed ? Config.Icon.music : Config.Icon.profile)
                        .animation(.default)
                        .font(.system(size: 25.0))
                        
                }
                .foregroundColor(Color.black.opacity(self.index == 3 ? 1 : 0.2))
            }.offset(x: 0, y: isPlusSignPressed ? -50 : 0)
            .animation(.default)
        }
        .padding(.horizontal, 35)
        .background(isPlusSignPressed ? Color(.systemGray6) : Color.white)
        .animation(.default)
    }
}

