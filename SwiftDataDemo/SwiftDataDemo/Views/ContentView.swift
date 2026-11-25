//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by Andres de la Cruz on 9/10/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Task.createdAt, order: .reverse) private var tasks: [Task]
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var showingAdd = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    HStack {
                        Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                            .foregroundStyle(task.isDone ? .green : .secondary)
                            .onTapGesture {
                                task.isDone.toggle()
                            }
                        Text(task.title)
                            .strikethrough(task.isDone)
                    }
                }
                .onDelete(perform: deleteTasks)
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Add", systemImage: "plus") {
                        showingAdd = true
                    }
                }
            }
            .sheet(isPresented: $showingAdd) {
                AddTaskView()
            }
        }
    }
    
    private func deleteTasks(at offsets: IndexSet) {
        for index in offsets{
            modelContext.delete(tasks[index])
        }
    }
}
