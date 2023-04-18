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
            NavigationStack {
                Text("Settings")
            }
        }
        .onAppear {
            
        }
        .fullScreenCover(isPresented: $showSignInView) {
            NavigationStack {
                AuthenticationView()
            }
        }
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
