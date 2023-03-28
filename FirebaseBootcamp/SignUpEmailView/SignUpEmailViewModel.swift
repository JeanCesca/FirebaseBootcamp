//
//  SignInEmailViewModel.swift
//  FirebaseBootcamp
//
//  Created by Jean Ricardo Cesca on 24/03/23.
//

import Foundation

@MainActor
final class SignUpEmailViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
        
    public func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email and password found.")
            return
        }
        
        try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
    
    public func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email and password found.")
            return
        }
        
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
    
    
}
