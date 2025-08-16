//
//  AppState.swift
//  AIChatBot
//
//  Created by Nando on 8/16/25.
//

import Foundation

@Observable
final class AppState {
    var isShowingTabBar: Bool {
        didSet {
            UserDefaults.isShowingTabBar = isShowingTabBar
        }
    }
    
    init(isShowingTabBar: Bool = UserDefaults.isShowingTabBar) {
        self.isShowingTabBar = isShowingTabBar
    }
}

extension UserDefaults {
    private struct Keys {
        static let isShowingTabBarKey = "is_showing_tab_bar"
    }
    
    static var isShowingTabBar: Bool {
        get {
            standard.bool(forKey: Keys.isShowingTabBarKey)
        }
        set {
            standard.setValue(newValue, forKey: Keys.isShowingTabBarKey)
        }
    }
}
