//
//  DashboardView.swift
//  BookMeNow-Develop
//
//  Created by Yurii Goroshenko on 24.07.2023.
//

import shared
import SwiftUI

struct DashboardView: View {
    // MARK: - Properties
    @StateObject var viewModel: DashboardViewModel
    @State var detentHeight: CGFloat = 0
    
    // MARK: - Lifecycle
    var body: some View {
        NavigationView {
            NavigationStack {
                BaseView(
                    leadingView: LeadingView.eraseToAnyView(),
                    trailingView: TrailingView.eraseToAnyView(),
                    content: { ContentView }
                )
                .navigationDestination(isPresented: $viewModel.toServiceDetail) {
                    DashboardPageBuilder.constructServiceView()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .environment(\.colorScheme, .light)
        .onAppear {
            viewModel.getPlaces()
        }
    }
    
    var ContentView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24.0) {
                SearchInputView
                
                Text(String(localized: "DASHBOARD-NEXTVISIT"))
                    .font(Font.H4Bold)
                
                NextVisit
                
                Text(String(localized: "DASHBOARD-NEARBY"))
                    .font(Font.H4Bold)
                    .foregroundColor(Color.greyscale900)
                
                ForEach(viewModel.restaurants) { _ in
                    VisitItemRow()
                        .onTapGesture {
                            viewModel.toServiceDetail = true
                        }
                }
                .shadow(color: Color.greyscale400, radius: 1.0)
                
                Spacer()
            }
            .padding(.horizontal, 16.0)
        }
    }
    
    var LeadingView: some View {
        HStack(spacing: 16.0) {
            Images.Logo
            
            Text(String(localized: "APP-NAME"))
                .font(Font.H4Bold)
                .foregroundColor(Color.greyscale900)
        }
    }
    
    var SearchInputView: some View {
        AppInputField(
            fieldData: $viewModel.searchData,
            leadingView: Icons.Search.eraseToAnyView(),
            trailingView: SearchFilterView.eraseToAnyView()
        )
        .sheet(isPresented: $viewModel.toSearchFilter) {
            FilterView()
                .padding(.top, 32.0)
                .readHeight()
                .onPreferenceChange(HeightPreferenceKey.self) { height in
                    if let height {
                        detentHeight = height
                    }
                }
                .presentationDetents([.height(detentHeight)])
                .presentationDragIndicator(.visible)
        }
        .padding(.top, 8.0)
    }
    
    var SearchFilterView: some View {
        Button(
            action: { viewModel.toSearchFilter = true },
            label: { Icons.Filter.foregroundColor(Color.primary500) }
        )
    }
    
    var NextVisit: some View {
        NextVisitView(
            onCallPress: {
                
            },
            onCancelPress: { viewModel.toCancelVisit = true },
            onMapPress: {
                
            }
        )
        .shadow(radius: 16.0)
        .sheet(isPresented: $viewModel.toCancelVisit) {
            CancelBookingView()
                .padding(.top, 32.0)
                .readHeight()
                .onPreferenceChange(HeightPreferenceKey.self) { height in
                    if let height {
                        detentHeight = height + 36
                    }
                }
                .presentationDetents([.height(detentHeight)])
                .presentationDragIndicator(.visible)
        }
    }
    
    var TrailingView: some View {
        Button(
            action: { print("") },
            label: { Icons.Notification.foregroundColor(Color.greyscale900) }
        )
    }
}

#Preview {
    DashboardPageBuilder.constructDashboardView()
}
