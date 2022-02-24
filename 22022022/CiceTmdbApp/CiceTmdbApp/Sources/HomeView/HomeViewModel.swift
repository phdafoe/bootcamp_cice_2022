//
//  HomeViewModel.swift
//  CiceTmdbApp
//
//  Created by TECDATA ENGINEERING on 24/2/22.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var selectedTabItem: TabItemViewModel.TabItemType = .movies
    
    let tabItemViewModels = [
        TabItemViewModel(imageName: "tv", title: "Movies", type: .movies),
        TabItemViewModel(imageName: "play.tv.fill", title: "Shows", type: .shows),
        TabItemViewModel(imageName: "person.2.circle", title: "People", type: .people),
        TabItemViewModel(imageName: "magnifyingglass", title: "Search", type: .search),
        TabItemViewModel(imageName: "person.fill", title: "Profile", type: .profile)
    ]
}

struct TabItemViewModel: Hashable {
    
    let imageName: String
    let title: String
    let type: TabItemType
    
    enum TabItemType{
        case movies
        case shows
        case people
        case search
        case profile
    }
}
