//
//  AccountView.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-06-03.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("Account")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                Spacer()
            }
            Spacer()
        }
        .frame(maxHeight: .infinity)
        .padding(.horizontal, 30)
        .padding(.top, 45)
    }
}

#Preview {
    AccountView()
}
