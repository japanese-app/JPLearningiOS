//
//  BrowseView.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-05-19.
//

import SwiftUI

struct BrowseView: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("Browse")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                Spacer()
                HStack {
                    Image("SearchIcon")
                    Image("QuestionIcon")
                    Image("SettingsIcon")
                }
            }.padding(.horizontal, 30)
            // Add scrollable contents
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(1...20, id: \.self) { item in
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.white)
                                .frame(maxWidth: .infinity)
                                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 4)
                            HStack (spacing: 20) {
                                Text("001")
                                    .foregroundColor(Color("primary-orange"))
                                    .font(.system(size: 16))
                                    .bold()
                                VStack (alignment: .leading, spacing: 4) {
                                    Text("〜たことがある")
                                        .font(.system(size: 14))
                                    Text("have done")
                                        .font(.system(size: 12))
                                }
                                Spacer()
                            }
                            .padding(.horizontal, 18)
                            .padding(.vertical, 12)
                        }
                    }
                }.padding([.leading, .trailing], 6)
            }.padding(.horizontal, 24)
            
        }
        
    }
}

#Preview {
    BrowseView()
}
