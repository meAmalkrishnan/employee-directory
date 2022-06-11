//
//  EmployeeListView.swift
//  SampleWork

import SwiftUI

struct EmployeeListView: View {
    @ObservedObject var employeeController = EmployeeController()
    @EnvironmentObject var settings: Settings
    @State var empList = [EmployeeTemp]()
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("Employees")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .foregroundColor(Color.green)
                Spacer()
            }
            ScrollView{
                VStack{
                    ForEach(empList, id:\.self){ emp in
                        Button(action: {
                            self.settings.employeeDetails = emp
                            settings.employee.module = Constants().employeeDetailsView
                        }){
                            HStack{
                                if emp.profile_image != nil{
                                    HStack{
                                        AsyncImage(url: URL(string: emp.profile_image!), content: { image in
                                            image.resizable()
                                                .clipShape(Circle())
                                                .frame(width: 60, height: 60)
                                                .clipped()
                                        }, placeholder: {
                                        ProgressView()
                                        })
                                    }
                                }
                                else{
                                    Image(systemName: "person.crop.circle.fill.badge.plus")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color.gray)
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                }
                                VStack{
                                    HStack{
                                        Text("Name: \(emp.name ?? "")")
                                        Spacer()
                                    }.frame(height: 20)
                                    HStack{
                                        Text("Company: \(emp.name ?? "")")
                                        Spacer()
                                    }.frame(height: 20)
                                }.foregroundColor(Color(Constants().black))
                                Spacer()
                            }
                        }
                        Divider()
                            .background(Color.gray)
                            .frame(height: 1)
                            .padding(.leading, 15)
                    }
                }.padding([.horizontal,.vertical], 10)
            }
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .topLeading)
        .onAppear{
            let group = DispatchGroup()
            employeeController.getEmployeeDetails(group: group)
            group.notify(queue: .main){
                _ = EmployeeDataManager().deleteAllEntity()
                for employeeDetails in employeeController.employeeEntity{
                    _ = EmployeeDataManager().insertEntity(employeeDetails: employeeDetails)
                }
            empList = EmployeeDataManager().retrieveEntity()
            }
        }
    }
}

struct EmployeeListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView()
    }
}
