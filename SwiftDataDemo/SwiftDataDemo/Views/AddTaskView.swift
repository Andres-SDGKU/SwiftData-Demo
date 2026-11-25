//
//  AddTaskView.swift
//  SwiftDataDemo
//
//  Created by Andres de la Cruz on 9/10/26.
//

import SwiftUI
import SwiftData

struct AddTaskView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Task title", text: $title)
            }
            .navigationTitle("New task")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let task = Task(title: title)
                        modelContext.insert(task)
                        dismiss()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
}
