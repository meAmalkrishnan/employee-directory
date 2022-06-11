//
//  EmployeeController.swift
//  SampleWork

import Foundation

public class EmployeeController: ObservableObject{
    @Published var employeeEntity = [Employee]()
    
    func getEmployeeDetails(group: DispatchGroup){
        guard let url = URL(string: "https://www.mocky.io/v2/5d565297300000680030a986")
        else{ return }
        group.enter()
        let task = URLSession.shared.dataTask(with: url){ (data,response,error) in
            if error != nil{
                print(error!.localizedDescription)
            }
            guard let data = data else{ return }
            do{
                let baseData = try JSONDecoder().decode([Employee].self, from: data)
                DispatchQueue.main.async {
                    self.employeeEntity = baseData
                    group.leave()
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
}
