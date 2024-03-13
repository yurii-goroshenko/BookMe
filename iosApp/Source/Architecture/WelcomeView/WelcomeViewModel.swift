//
//  WelcomeViewModel.swift
//  iosApp
//
//  Created by Yurii Goroshenko on 16.01.2024.
//

import shared
import SwiftUI

protocol WelcomeViewModelProtocol: ObservableObject {
    var toLogin: Bool { get set }
    var toSignIn: Bool { get set }
    
    func loginViaFacebook()
    func loginViaGoogle()
    func signIn()
}

final class WelcomeViewModel: WelcomeViewModelProtocol {
    // MARK: - Properties
    private let repository = shared.UserRepository()
    @Published var toLogin = false
    @Published var toSignIn = false
    
    // MARK: - Lifecycle
    deinit {
        printLog("deinit -> ", self)
    }
    
    // MARK: - Public
    func loginViaFacebook() {
        // FacebookSDK
        // RepositoryLogin
        
        repository.login { _, _ in
            printLog("")
        }
        
        toSignIn = true
    }
    
    func loginViaGoogle() {
        // GoogleSDK
        // RepositoryLogin
        
        GoogleManager.signIn { [weak self] _ in
            self?.toSignIn = true
        }
    }
    
    func signIn() {
        toLogin = true
    }
}
