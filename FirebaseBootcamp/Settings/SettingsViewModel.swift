//
//  SettingsViewModel.swift
//  FirebaseBootcamp
//
//  Created by Jean Ricardo Cesca on 24/03/23.
//

import Foundation

@MainActor
final class SettingsViewModel: ObservableObject {
    
    public func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
    public func resetPassword() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
    
    public func updatePassword() async throws {
        let password = "12345671"
        try await AuthenticationManager.shared.updatePassword(password: password)
    }
    
    public func updateEmail() async throws {
        let email = "hello222@haha.com"
        try await AuthenticationManager.shared.updateEmail(email: email)
    }
    
}
