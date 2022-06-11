//
//  Settings.swift
//  SampleWork

import SwiftUI
import Foundation
import Combine

class Settings: ObservableObject {
    let objectWillChange = PassthroughSubject<Settings,Never>()
    var employee = Employee(module: "EmployeeListView"){
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send(self)
            }
        }
    }
    var employeeDetails = EmployeeTemp(){
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send(self)
            }
        }
    }
}
