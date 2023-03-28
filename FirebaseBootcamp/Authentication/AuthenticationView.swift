//
//  AuthenticationView.swift
//  FirebaseBootcamp
//
//  Created by Jean Ricardo Cesca on 24/03/23.
//

import SwiftUI

struct AuthenticationView: View {
    
    @Binding var showSignUpView: Bool
    
    var body: some View {
        VStack {
            NavigationLink {
                SignUpEmailView(showSignUpView: $showSignUpView)
            } label: {
                Text("Sign In With E-mail")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 20)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Sign In")
        .background(Color.appColors.backgroundColor2)
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AuthenticationView(showSignUpView: .constant(false))
        }
    }
}
