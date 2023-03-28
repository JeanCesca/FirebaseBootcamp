//
//  SignInView.swift
//  FirebaseBootcamp
//
//  Created by Jean Ricardo Cesca on 24/03/23.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject private var viewModel = SignInViewModel()
    
    @Binding var showSignUpView: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.appColors.textWhite, .appColors.backgroundColor], startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            VStack {
                TextField("Enter your e-mail", text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .background {
                        Color.white
                            .cornerRadius(10)
                    }
                
                SecureField("... and your drag secret word", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .background {
                        Color.white
                            .cornerRadius(10)
                    }
                
                Button {
                    Task {
                        do {
                            try await viewModel.signIn()
                            self.showSignUpView = false
                            return
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 20)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Sign In")
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignInView(showSignUpView: .constant(false))
        }
    }
}
