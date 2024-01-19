//
//  TutorialWelcomeModuleView.swift
//  iosApp
//
//  Created by Yurii Goroshenko on 16.01.2024.
//

import SwiftUI

struct TutorialWelcomeModuleView: View {
    // MARK: - Properties
    @State var toLogin = false
    
    // MARK: - Lifecycle
    var body: some View {
        NavigationStack {
            ZStack {
                Backgrounds.Tutorial
                    .opacity(0.85)
                
                VStack {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 12.0) {
                        Text("Welcome to 👋")
                            .attributed(.H1Bold, color: Color.white)
                        
                        Text("BookMe")
                            .attributed(.H1Bold, color: Color.primary500)
                        
                        Text("The best barbers, salons and other services in your app.")
                            .attributed(.BodyXLargeMedium, color: Color.white)
                    }
                    .padding(.bottom, 64.0)
                    .padding(.horizontal, 32.0)
                }
            }
            .ignoresSafeArea(.all)
            .background(Color.black)
            .navigationDestination(isPresented: $toLogin) {
                TutorialDescriptionModuleView()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.toLogin = true
                }
            }
        }
    }
}

#Preview {
    TutorialWelcomeModuleView()
}