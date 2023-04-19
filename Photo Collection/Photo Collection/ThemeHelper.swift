//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Harm on 4/14/23.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey = "themePreference"
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
    
    init() {
        if UserDefaults.standard.string(forKey: themePreferenceKey) == nil {
            setThemePreferenceToBlue()
        }
    }
    
}
