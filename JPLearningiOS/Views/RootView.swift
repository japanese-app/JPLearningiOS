//
//  RootView.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-05-19.
//

import SwiftUI

struct RootView: View {
    @State var selectedTab: Tabs = .browse
    var body: some View {
        
        VStack {
            Spacer()
            CustomTabBar(selectedTab: $selectedTab)
        }
        
    }
}

#Preview {
    RootView()
}
