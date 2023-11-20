//
//  AddView.swift
//  iExpenseNavigation
//
//  Created by Henrieke Baunack on 11/19/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = "New expense"
    @State private var type = "Personal"
    @State private var amount = 0.0
    let types = ["Personal", "Business"]
    
    var expenses: Expenses
//    @State var navTitle = "New expense"
    
    var body: some View {
        NavigationStack{
            Form{
//                TextField("Name", text: $name)
                Picker("Type", selection: $type){
                    ForEach(types, id:\.self){
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button("Save"){
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(item)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    // do something
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }.navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
