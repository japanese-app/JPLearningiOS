//
//  CustomNavBar.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-05-19.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tabs
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color("light-grey"))
                .frame(height: 1)
            HStack(alignment: .bottom, spacing: 25) {
                ForEach(Tabs.allCases, id: \.self) { tab in
                    TabButton(tab: tab, selectedTab: $selectedTab)
                }
            }.frame(height: 60)
        }
        
    }
}

struct TabButton: View {
    let tab: Tabs
    @Binding var selectedTab: Tabs

    var body: some View {
        Button {
            selectedTab = tab
        } label: {
            VStack (alignment: .center, spacing: 6) {
                Image(tab.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: tab.iconSize.width, height: tab.iconSize.height)
                Text(tab.title)
                    .font(.system(size: 12))
            }
            .foregroundColor(selectedTab == tab ? Color("icon-selected") : Color("icon-primary"))
        }
    }
}

enum Tabs: Int, CaseIterable {
    case browse = 0
    case mylist = 1
    case learning = 2
    case media = 3
    case journal = 4
    
    var imageName: String {
        switch self {
        case .browse: return "BrowseIcon"
        case .mylist: return "MyListIcon"
        case .learning: return "LearningIcon"
        case .media: return "MediaIcon"
        case .journal: return "JournalIcon"
        }
    }
    
    var iconSize: CGSize {
        switch self {
        case .browse: return CGSize(width: 34, height: 34)
        case .mylist: return CGSize(width: 36, height: 36)
        case .learning: return CGSize(width: 32, height: 32)
        case .media, .journal: return CGSize(width: 30, height: 30)
        }
    }
    
    var title: String {
        switch self {
        case .browse: return "Browse"
        case .mylist: return "Mylist"
        case .learning: return "Learning"
        case .media: return "Media"
        case .journal: return "Journal"
        }
    }
}
