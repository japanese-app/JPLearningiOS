//
//  CustomNavBar.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-05-19.
//

import SwiftUI

struct CustomNavBar: View {
    var body: some View {
        
        HStack (alignment: .bottom, spacing: 25) {
            Button {
                // swift to chats
            } label: {
                VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 6) {
                    Image("BrowseIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 34, height: 34)
                    Text("Browse")
                        .font(.system(size: 12))
                }.tint(Color("icon-primary"))
            }
            Button {
                // swift to chats
            } label: {
                VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 6) {
                    Image("MyListIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                    Text("Mylist")
                        .font(.system(size: 12))
                }.tint(Color("icon-primary"))
            }
            Button {
                // swift to chats
            } label: {
                VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 6) {
                    Image("LearningIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    Text("Learning")
                        .font(.system(size: 12))
                }.tint(Color("icon-primary"))
            }
            Button {
                // swift to chats
            } label: {
                VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 6) {
                    Image("MediaIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    Text("Media")
                        .font(.system(size: 12))
                }.tint(Color("icon-primary"))
            }
            Button {
                // swift to chats
            } label: {
                VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 6) {
                    Image("JournalIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    Text("Journal")
                        .font(.system(size: 12))
                }.tint(Color("icon-primary"))
            }
        }
        .frame(height: 82)
//        .background(Color("black"))
        
    }
}

#Preview {
    CustomNavBar()
}
