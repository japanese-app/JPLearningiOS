//
//  LearningView.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-05-19.
//

import SwiftUI

struct LearningView: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("Learning")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                Spacer()
            }
            Spacer()
        }
        .frame(maxHeight: .infinity)
        .padding(.horizontal, 30)
    }
}

#Preview {
    LearningView()
}
