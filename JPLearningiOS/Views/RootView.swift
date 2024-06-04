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
        NavigationStack {
            VStack(spacing: 0) {
                if selectedTab != .account {
                    HStack (spacing: 0) {
                        Spacer()
                        Button(action: {
                            selectedTab = .account
                        }) {
                            Image("AccountIcon")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 5)
                }
                switch selectedTab {
                case .browse:
                    BrowseView()
                case .mylist:
                    MylistView()
                case .learning:
                    LearningView()
                case .media:
                    MediaView()
                case .journal:
                    JournalView()
                case .account:
                    AccountView()
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
