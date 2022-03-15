//
//  MenuViewModel.swift
//  SlideMenuApp
//
//  Created by TECDATA ENGINEERING on 15/3/22.
//

import Foundation

enum MenuOptions: String{
    case currentView
    case logout
    case settings
    case alerts
    case reports
}



class MenuViewModel: ObservableObject {
    var topItems: [MenuItemViewModel] = [
        MenuItemViewModel(identifier: MenuOptions.currentView.rawValue,
                          icon: "book_sales",
                          title: "Pagina Actual",
                          childs: []),
        MenuItemViewModel(identifier: MenuOptions.settings.rawValue,
                          icon: "budget",
                          title: "Setting",
                          childs: []),
        MenuItemViewModel(identifier: MenuOptions.reports.rawValue,
                          icon: "history",
                          title: "Reportes",
                          childs: [])
    ]
    
    
    var bottomItems: [MenuItemViewModel] = [
        MenuItemViewModel(identifier: MenuOptions.logout.rawValue,
                          title: "Logout"),
        MenuItemViewModel(identifier: MenuOptions.alerts.rawValue,
                          title: "Alertas")
    ]
}
