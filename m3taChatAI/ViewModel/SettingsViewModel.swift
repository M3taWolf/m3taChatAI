//
//  SettingsViewModel.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 31.03.23.
//

import Foundation

@MainActor

final class SettingsViewModel: ObservableObject {
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
}
