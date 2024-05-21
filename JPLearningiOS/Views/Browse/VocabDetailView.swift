//
//  BrowseDetailView.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-05-20.
//

import SwiftUI

struct VocabDetailView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Rectangle()
                .fill(Color("light-grey"))
                .frame(height: 1)
            ScrollView {
                VStack(spacing: 15) {
                    Text("hi")
                }
            }.padding(.horizontal, 30)
            Spacer()
            VocabMenuBar()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 14))
                        Text("Browse")
                            .font(.system(size: 16))
                    }
                    .padding(.leading, 10)
                }
            }
            ToolbarItem(placement: .principal) {
                Text("001")
                    .padding(.vertical, 3)
                    .padding(.horizontal, 18)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color("primary-orange").opacity(0.7),
                                        Color("primary-orange").opacity(0.25)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                    )
                    .font(.system(size: 16))
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // Action for the additional icon
                }) {
                    Image("SettingsIcon")
                        .padding(.trailing, 15)
                }
            }
        }
    }
}

struct VocabMenuBar: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color("light-grey"))
                .frame(height: 1)
            HStack(alignment: .center, spacing: 15) {
                Image("FavoriteIcon")
                    .frame(width: 34, height: 34)
                Text("Review")
                    .font(.system(size: 14))
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color("icon-primary"))
                    )
                Text("Furigana")
                    .font(.system(size: 14))
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color("icon-primary"))
                    )
                Image("NoteIcon")
                    .frame(width: 34, height: 34)
                HStack {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 18))
                        .fontWeight(.light)
                    Image(systemName: "arrow.right")
                        .font(.system(size: 18))
                        .fontWeight(.light)
                }
            }.frame(height: 55)
        }
        
    }
}

#Preview {
    VocabDetailView()
}
