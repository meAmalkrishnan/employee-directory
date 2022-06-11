//
//  EmployeeDetailsView.swift
//  SampleWork

import SwiftUI

struct EmployeeDetailsView: View {
    @EnvironmentObject var settings: Settings
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    settings.employee.module = Constants().employeeListView
                }){
                    Image(systemName: "arrow.left")
                        .font(.system(size: 25))
                        .foregroundColor(Color(Constants().black))
                        .frame(alignment: .leading)
                }
                Spacer()
                Spacer()
                Text("Employee Details")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .foregroundColor(Color.green)
                Spacer()
                Spacer()
                Spacer()
            }.padding([.vertical,.horizontal], 15)
            ScrollView{
                VStack{
                    VStack{
                        HStack{
                            Spacer()
                            if self.settings.employeeDetails.profile_image != nil{
                                HStack{
                                    AsyncImage(url: URL(string: self.settings.employeeDetails.profile_image!), content: { image in
                                        image.resizable()
                                            .clipShape(Circle())
                                            .frame(width: 100, height: 100)
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
                            Spacer()
                        }.padding(.bottom, 10)
                        VStack(spacing: 10){
                            HStack{
                                Text("Name: \(self.settings.employeeDetails.name ?? "")")
                                Spacer()
                            }
                            HStack{
                                Text("User Name: \(self.settings.employeeDetails.username ?? "")")
                                Spacer()
                            }
                            HStack{
                                Text("Email: \(self.settings.employeeDetails.email ?? "")")
                                Spacer()
                            }
                            HStack{
                                Text("Address")
                                    .fontWeight(.bold)
                                    .font(.system(size: 18))
                                Spacer()
                            }
                            HStack{
                                Text("Street: \(self.settings.employeeDetails.street ?? "")")
                                Spacer()
                            }
                            HStack{
                                Text("Suite: \(self.settings.employeeDetails.suite ?? "")")
                                Spacer()
                            }
                            HStack{
                                Text("City: \(self.settings.employeeDetails.city ?? "")")
                                Spacer()
                            }
                            HStack{
                                Text("Zip Code: \(self.settings.employeeDetails.zipcode ?? "")")
                                Spacer()
                            }.padding(.bottom, 10)
                        }
                    }
                    VStack(spacing: 10){
                        
                        HStack{
                            Text("latitude: \(self.settings.employeeDetails.lat ?? "")")
                            Spacer()
                        }
                        HStack{
                            Text("longitude: \(self.settings.employeeDetails.lng ?? "")")
                            Spacer()
                        }
                        HStack{
                            Text("phone: \(self.settings.employeeDetails.phone ?? "")")
                            Spacer()
                        }
                        HStack{
                            Text("Website: \(self.settings.employeeDetails.website ?? "")")
                            Spacer()
                        }
                        HStack{
                            Text("Company")
                                .fontWeight(.bold)
                                .font(.system(size: 18))
                            Spacer()
                        }
                        HStack{
                            Text("Name: \(self.settings.employeeDetails.companyname ?? "")")
                            Spacer()
                        }
                        HStack{
                            Text("Catch Phrase: \(self.settings.employeeDetails.catchPhrase ?? "")")
                            Spacer()
                        }
                        HStack{
                            Text("Bs: \(self.settings.employeeDetails.bs ?? "")")
                            Spacer()
                        }
                    }
                }.foregroundColor(Color(Constants().black))
                    .padding(.horizontal, 15)
            }
        }.frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading)
    }
}

struct EmployeeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeDetailsView()
    }
}
