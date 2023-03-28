//
//  RootView.swift
//  FirebaseBootcamp
//
//  Created by Jean Ricardo Cesca on 24/03/23.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignUpView: Bool = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                SettingsView(showSingInView: $showSignUpView)
            }
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignUpView = authUser == nil ? true : false
        }
        .fullScreenCover(isPresented: $showSignUpView) {
            NavigationStack {
                AuthenticationView(showSignUpView: $showSignUpView)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
