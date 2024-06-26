//
//  Icons.swift
//  BookMeNow-Develop
//
//  Created by Yurii Goroshenko on 17.08.2023.
//

import SwiftUI

enum Icons {
    static var Search: some View {
        Image("ic-search")
            .resizable()
            .renderingMode(.template)
            .frame(width: 20, height: 20)
    }
    
    static var Filter: some View {
        Image("ic-filter")
            .resizable()
            .renderingMode(.template)
            .frame(width: 20, height: 20)
    }
   
    static var Notification: some View {
        Image("ic-notification")
            .resizable()
            .renderingMode(.template)
            .frame(width: 20, height: 20)
    }
    
    // Image Arrow down
    static var ArrowDown: some View {
        Image("ic-arrow-down")
            .resizable()
            .renderingMode(.template)
            .frame(width: 20, height: 20)
    }
    
    // Image Arrow right
    static var ArrowRight: some View {
        Image("ic-arrow-right")
            .resizable()
            .renderingMode(.template)
            .frame(width: 20, height: 20)
    }
    
    // Image Calendar
    static var Calendar: some View {
        Image("ic-calendar")
            .resizable()
            .renderingMode(.template)
            .frame(width: 20, height: 20)
    }
    
    static var Back: some View {
        Image("ic-back")
            .resizable()
            .renderingMode(.template)
            .frame(width: 20, height: 20)
    }
    
    static var Phone: some View {
        Image("ic-call")
            .resizable()
            .renderingMode(.template)
            .frame(width: 20, height: 20)
    }
    
    static var Map: some View {
        Image("ic-location")
            .resizable()
            .renderingMode(.template)
            .frame(width: 20, height: 20)
    }
    
    static var MapBold: some View {
        Image("ic-location-bold")
            .resizable()
            .renderingMode(.template)
            .frame(width: 20, height: 20)
    }
    
    static var Star: some View {
        Image("ic-star")
            .resizable()
            .renderingMode(.template)
            .frame(width: 26, height: 26)
    }
    
    static var StarBold: some View {
        Image("ic-star-bold")
            .resizable()
            .renderingMode(.template)
            .frame(width: 26, height: 26)
    }
    
    static var Delete: some View {
        Image("ic-delete")
            .resizable()
            .renderingMode(.template)
            .frame(width: 20, height: 20)
    }
}

enum TabIcons {
    static var Home: some View {
        Image("ic-home")
            .resizable()
            .renderingMode(.template)
            .frame(width: 20, height: 20)
    }
    
    static var MapBold: some View {
        Image("ic-location-bold")
            .resizable()
            .renderingMode(.template)
            .frame(width: 20, height: 20)
    }
    
    static var Profile: some View {
        Image("ic-profile")
            .resizable()
            .renderingMode(.template)
            .frame(width: 20, height: 20)
    }
}

enum Images {
    static var Welcome: some View {
        Image("img-welcome")
            .resizable()
            .scaledToFit()
            .padding(.horizontal, 16.0)
    }
    
    static var TutorialPage1: some View {
        Image("img-tutorial-1")
            .resizable()
            .scaledToFit()
            .padding(.horizontal, 16.0)
    }
    
    static var TutorialPage2: some View {
        Image("img-tutorial-2")
            .resizable()
            .scaledToFit()
            .padding(.horizontal, 16.0)
    }
    
    static var Logo: some View {
        Image("img-welcome")
            .resizable()
            .frame(width: 20, height: 20)
    }
    
    static var TableMask: some View {
        Image("img-mask")
            .resizable()
            .frame(width: 80, height: 80)
    }
}

enum InfoImages {
    static var Registration: some View {
        Image("img-info-registration")
            .resizable()
            .scaledToFit()
    }
    
    static var Location: some View {
        Image("img-info-location")
            .resizable()
            .scaledToFit()
    }
    
    static var Rate: some View {
        Image("img-info-rate")
            .resizable()
            .scaledToFit()
    }
}

enum Backgrounds {
    static var Tutorial: some View {
        Image("bg-welcome")
            .resizable()
    }
}

struct ImageAsset: Identifiable {
    var id: Int
    var name: String
    
    static var all: [Self] {
        [
            .init(id: 0, name: "img-tutorial-1"),
            .init(id: 1, name: "img-tutorial-2")
        ]
    }
    
    static func name(_ id: Int) -> String {
        Self.all.first { $0.id == id }?.name ?? ""
    }
}
