//
//  RootView.swift
//  SwiftUI_Firebase
//
//  Created by Dimitrije Volarevic on 18.4.23..
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack {
            if !showSignInView {
                NavigationStack {
                    SettingsView(showSignInView: $showSignInView)
                }
            }
            
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticateUser()
            self.showSignInView = authUser == nil
            
            try? AuthenticationManager.shared.getProviders()
        }
        .fullScreenCover(isPresented: $showSignInView) {
            NavigationStack {
                AuthenticationView(showSignInView: $showSignInView)
            }
        }
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
