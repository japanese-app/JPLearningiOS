//
//  RootView.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-05-19.
//

import SwiftUI

struct RootView: View {
    @State var selectedTab: Tabs = .browse
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {
                BrowseView()
                    .tag(Tabs.browse)
                MylistView()
                    .tag(Tabs.mylist)
                LearningView()
                    .tag(Tabs.learning)
                MediaView()
                    .tag(Tabs.media)
                JournalView()
                    .tag(Tabs.journal)
            }
            
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    RootView()
}
