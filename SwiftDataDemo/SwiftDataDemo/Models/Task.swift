//
//  Task.swift
//  SwiftDataDemo
//
//  Created by Andres de la Cruz on 9/10/26.
//
 
import Foundation
import SwiftData

@Model
final class Task {
    var title: String
    var isDone: Bool
    var createdAt: Date
    
    init(title: String, isDone: Bool = false, createdAt: Date = .now) {
        self.title = title
        self.isDone = isDone
        self.createdAt = createdAt
    }
}
