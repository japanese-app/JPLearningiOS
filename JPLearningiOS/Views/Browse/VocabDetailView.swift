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
            Text("This is the destination view")
                .font(.largeTitle)
                .padding()
        }
        .navigationBarBackButtonHidden(true) // Hide the default back button
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left") // Custom back button image
                            .font(.system(size: 14))
                        Text("Browse")
                            .font(.system(size: 16))
                    }
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
                }
            }
        }
    }
}

#Preview {
    VocabDetailView()
}
