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
        NavigationView {
            VStack {
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
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    RootView()
}
