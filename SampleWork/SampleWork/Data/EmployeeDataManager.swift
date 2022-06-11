//
//  EmployeeDataManager.swift
//  SampleWork

import Foundation
import CoreData
import UIKit

class EmployeeDataManager{
    func insertEntity(employeeDetails: Employee)-> String {
        guard case let (employeeEntity?, managedContext?) = DatabaseManager().getInsertContextEntity(entity: "Employees") else { return Constants().error }
        
        let employee = NSManagedObject(entity: employeeEntity, insertInto: managedContext)
        employee.setValue(employeeDetails.id, forKeyPath: "id")
        employee.setValue(employeeDetails.name, forKeyPath: "name")
        employee.setValue(employeeDetails.username, forKeyPath: "username")
        employee.setValue(employeeDetails.email, forKeyPath: "email")
        employee.setValue(employeeDetails.profile_image, forKeyPath: "profileImage")
        employee.setValue(employeeDetails.address?.street, forKeyPath: "street")
        employee.setValue(employeeDetails.address?.suite, forKeyPath: "suite")
        employee.setValue(employeeDetails.address?.city, forKeyPath: "city")
        employee.setValue(employeeDetails.address?.zipcode, forKeyPath: "zipcode")
        employee.setValue(employeeDetails.address?.geo?.lat, forKeyPath: "lat")
        employee.setValue(employeeDetails.address?.geo?.lng, forKey: "lng")
        employee.setValue(employeeDetails.phone, forKeyPath: "phone")
        employee.setValue(employeeDetails.website, forKeyPath: "website")
        employee.setValue(employeeDetails.company?.name, forKeyPath: "companyName")
        employee.setValue(employeeDetails.company?.catchPhrase, forKeyPath: "catchPhrase")
        employee.setValue(employeeDetails.company?.bs, forKeyPath: "bs")
        do{
            try managedContext.save()
            return Constants().success
        } catch{
            return Constants().error
        }
    }
    func retrieveEntity()-> [EmployeeTemp] {
        var emp = [EmployeeTemp]()
        var employee = EmployeeTemp()
        do{
            guard case let (fetchRequest?, managedContext?) = DatabaseManager().getRetrieveContextEntity(entity: Constants().employeeEntity) else { return emp }
            let result = try managedContext.fetch(fetchRequest)
            if(result.count > 0){
                for data in result as! [NSManagedObject] {
                    employee.id = data.value(forKey: "id") as? Int
                    employee.name = data.value(forKey: "name") as? String
                    employee.username = data.value(forKey: "username") as? String
                    employee.email = data.value(forKey: "email") as? String
                    employee.profile_image = data.value(forKey: "profileImage") as? String
                    employee.street = data.value(forKey: "street") as? String
                    employee.suite = data.value(forKey: "suite") as? String
                    employee.city = data.value(forKey: "city") as? String
                    employee.zipcode = data.value(forKey: "zipcode") as? String
                    employee.lat = data.value(forKey: "lat") as? String
                    employee.lng = data.value(forKey: "lng") as? String
                    employee.phone = data.value(forKey: "phone") as? String
                    employee.website = data.value(forKey: "website") as? String
                    employee.name = data.value(forKey: "companyName") as? String
                    employee.catchPhrase = data.value(forKey: "catchPhrase") as? String
                    employee.bs = data.value(forKey: "bs") as? String
                    
                    emp.append(employee)
                }
            }else {
                return emp
            }
        } catch {
            return emp
        }
        return emp
    }
    
    func deleteAllEntity()-> String{
        do{
            guard case let (fetchRequest?, managedContext?) = DatabaseManager().getDeleteAllEntity(entity: Constants().employeeEntity) else { return Constants().error }
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            try managedContext.execute(deleteRequest)
            return Constants().success
        }catch{
            return Constants().error
        }
    }
}

