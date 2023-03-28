//
//  SettingsView.swift
//  FirebaseBootcamp
//
//  Created by Jean Ricardo Cesca on 24/03/23.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    
    @Binding var showSingInView: Bool
    
    var body: some View {
        List {
            Button {
                Task {
                    do {
                        try viewModel.signOut()
                        showSingInView = true
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Log Out")
            }

            
            Section {
                
                Button {
                    Task {
                        do {
                            try await viewModel.resetPassword()
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    Text("Reset Password")
                }
                
                Button {
                    Task {
                        do {
                            try await viewModel.updatePassword()
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    Text("Update Password")
                }
                
                Button {
                    Task {
                        do {
                            try await viewModel.updateEmail()
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    Text("Update Email")
                }
            } header: {
                Text("E-mail functions")
            }

        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView(showSingInView: .constant(false))
        }
    }
}
