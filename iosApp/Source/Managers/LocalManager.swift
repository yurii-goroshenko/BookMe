//
//  LocalManager.swift
//  iosApp
//
//  Created by Yurii Goroshenko on 16.03.2024.
//

import Foundation
import shared

final class LocalManager {
    static let shared = LocalManager()
    let kmmDefaults = KMMUserDefaults(context: NSObject())
    
}
