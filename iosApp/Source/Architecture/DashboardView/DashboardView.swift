//
//  DashboardView.swift
//  BookMeNow-Develop
//
//  Created by Yurii Goroshenko on 24.07.2023.
//

import SwiftUI

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
}

struct DashboardView: View {
    @ObservedObject var presenter = DashboardPresenter()
    let restaurants = [
        Restaurant(name: "Joe's Original"),
        Restaurant(name: "The Real Joe's Original"),
        Restaurant(name: "Original Joe's")
    ]
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            TabView {
                BaseView(leadingView: LeadingView.eraseToAnyView(), trailingView: TrailingView.eraseToAnyView(), content: { ContentView })
                    .tabItem {
                        Label("Home", systemImage: "ic-home")
                    }
                
                BaseView(leadingView: LeadingView.eraseToAnyView(), trailingView: TrailingView.eraseToAnyView(), content: { ContentView })
                    .tabItem {
                        Label("Profile", systemImage: "square.and.pencil")
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
        .environment(\.colorScheme, .light)
    }
    
    var LeadingView: some View {
        HStack(spacing: 16.0) {
            Images.Logo
            
            Text("BookMeNow")
                .font(Font.H4Bold)
                .foregroundColor(Color.greyscale900)
        }
    }
    
    var TrailingView: some View {
        Button(
            action: { print("") },
            label: { Icons.Notification.foregroundColor(Color.greyscale900) }
        )
    }
    
    var ContentView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24.0) {
                AppInputField(
                    fieldData: $presenter.searchData,
                    leadingView: Icons.Search.eraseToAnyView(),
                    trailingView: Icons.Filter.foregroundColor(Color.primary500).eraseToAnyView()
                )
                .padding(.top, 8.0)
                
                NextVisitView()
                    .shadow(radius: 16.0)
                
                Text("Nearby Your Location")
                    .font(Font.H4Bold)
                    .foregroundColor(Color.greyscale900)
                
                ForEach(restaurants) { restaurant in
                    TableVisitRow()
                }
                .shadow(color: Color.greyscale400 ,radius: 1.0)
                
                Spacer()
            }
            .padding(.horizontal, 16.0)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
