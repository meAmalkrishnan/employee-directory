//
//  EmployeeModels.swift
//  SampleWork

import Foundation

struct Emp: Codable,Hashable{
    var employee: Array<Employee>?
}
struct Employee: Codable,Hashable{
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var profile_image: String?
    var address: Address?
    var phone: String?
    var website: String?
    var company: Company?
    
    var module: String?
}
struct Address: Codable,Hashable{
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: Geo?
}
struct Geo: Codable,Hashable{
    var lat: String?
    var lng: String?
}
struct Company: Codable,Hashable{
    var name: String?
    var catchPhrase: String?
    var bs: String?
}

struct EmployeeTemp: Codable,Hashable{
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var profile_image: String?
    var street: String?
    var suite: String?
    var city: String?
    var lat: String?
    var lng: String?
    var zipcode: String?
    var geo: String?
    var phone: String?
    var website: String?
    var companyname: String?
    var catchPhrase: String?
    var bs: String?
    
    var module: String?
}

