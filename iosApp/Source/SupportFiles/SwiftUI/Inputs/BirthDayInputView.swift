//
//  BirthDayInputView.swift
//  iosApp
//
//  Created by Yurii Goroshenko on 24.11.2023.
//

import SwiftUI

struct BirthDayInputView: View {
    // MARK: - Properties
    @Binding var dateBirthday: FieldData
    @State var date = Date.now
    @State var toCalendar = false
    
    // MARK: - Lifecycle
    var body: some View {
        AppInputField(fieldData: $dateBirthday, trailingView: Icons.Calendar.eraseToAnyView()) {
            toCalendar = true
        }
        .sheet(isPresented: $toCalendar) {
            ZStack {
                Color.primary500
                    .opacity(0.05)
                    .edgesIgnoringSafeArea(.all)
                
                DatePicker("", selection: $date, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(maxHeight: 300)
                    .accentColor(Color.primary500)
                    .padding(8.0)
                    .presentationDetents([.height(360)])
            }
        }
        .onChange(of: date) { newValue in
            dateBirthday.value = newValue.toString
            toCalendar = false
        }
    }
}

#Preview {
    BirthDayInputView(
        dateBirthday: .constant(FieldData())
    )
}