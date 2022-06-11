//
//  RootView.swift
//  SampleWork

import SwiftUI
import LocalAuthentication
import CoreLocation

struct RootView: View {
    @EnvironmentObject var settings: Settings
    var body: some View {
        VStack{
            if settings.employee.module == Constants().employeeListView{
                EmployeeListView()
            }
            else if settings.employee.module == Constants().employeeDetailsView{
                EmployeeDetailsView()
            }
        }
    }
}
