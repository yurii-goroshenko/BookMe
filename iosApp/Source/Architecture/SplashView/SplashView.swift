//
//  SplashView.swift
//  iosApp
//
//  Created by Yurii Goroshenko on 06.04.2024.
//

import SwiftUI

// MARK: - Splash Page
struct SplashView<ViewModel>: View where ViewModel: SplashViewModelProtocol {
    // MARK: - Properties
    @StateObject var viewModel: ViewModel
    
    // MARK: - Lifecycle
    var body: some View {
        VStack {
            Spacer()
            
            Text(String(localized: "APP-NAME"))
                .attributed(.H0Bold, color: Color.primary500)
                .padding(24.0)
            
            Spacer()
        }
        .ignoresSafeArea(.all)
        .background(Color.background)
        .onAppear {
            viewModel.detectPage()
//            setRootView(Steps.splashAfter.PageView)
        }
    }
}

#Preview {
    Steps.splash.PageView
}
