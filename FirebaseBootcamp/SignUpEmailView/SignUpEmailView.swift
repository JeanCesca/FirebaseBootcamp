//
//  SignInEmailView.swift
//  FirebaseBootcamp
//
//  Created by Jean Ricardo Cesca on 24/03/23.
//

import SwiftUI

struct SignUpEmailView: View {
    
    @StateObject private var viewModel = SignUpEmailViewModel()
    
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
                            try await viewModel.signUp()
                            self.showSignUpView = false
                            return
                        } catch {
                            print("Usuário já cadastrado")
                        }
                    }
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 20)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                NavigationLink {
                    SignInView(showSignUpView: $showSignUpView)
                } label: {
                    VStack(spacing: 8) {
                        Text("Already have an account?")
                        Text("LOOK OVER THERE!!!! 💅")
                    }
                    .fontDesign(.monospaced)
                    .foregroundColor(Color.appColors.textWhite)
                    .font(.headline)
                }
                .padding(.top, 10)
            }
            .padding()
        }
        .navigationTitle("Sign Up")
    }
}

struct SignUpEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignUpEmailView(showSignUpView: .constant(true))
        }
    }
}
