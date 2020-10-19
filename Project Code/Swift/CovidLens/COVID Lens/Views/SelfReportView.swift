//
//  SelfReportView.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/7/20.
//

import SwiftUI
@available(iOS 14.0, *)

struct SelfReportView: View {
    
    @StateObject private var viewModel = SelfReportVM()
    
    // assign to view model
    @State private var affilIsExpanded: Bool = false
    @State private var selectedAffiliation: String = ""
    @State private var date = Date()
    @State private var hallIsExpanded: Bool = false
    @State private var selectedHall: String = ""
    
    @State private var selectedFrameworkIndex = 0
    
    var affiliations: [String] = ["Student", "Faculty", "Staff", "Contractor"]
    var resHall: [String] = ["Cone", "Grogan", "Guilford", "Mary Foust", "Moore/Strong", "North Spencer", "Phillips/Hawkins", "Ragsdale/Mendenhall", "Reynolds", "South Spencer", "Weil/Winfield"]
    
    @State private var phoneNumber: String = ""
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                ScrollView {
                    // self-report instructions
                    TabInfoView(icon: viewModel.icon, title: viewModel.title, info: viewModel.info)
                    
                    VStack {
                        Text("University Affiliation")
                            .font(.system(size: 18.0))
                            .foregroundColor(.black)
                        
                        // dropdown menu for campus affiliation
                        DisclosureGroup("\(selectedAffiliation)", isExpanded: $affilIsExpanded) {
                            VStack {
                                ForEach(affiliations) { affil in
                                    Text("\(affil)")
                                        .font(.body)
                                        .padding(.all, 2)
                                        .onTapGesture {
                                            self.selectedAffiliation = affil
                                            withAnimation {
                                                self.affilIsExpanded.toggle()
                                            }
                                        }
                                }
                            }
                        }.accentColor(.white)
                        .foregroundColor(.white)
                        .padding(.all, 12)
                        .background(Color(red: 0/255, green: 193/255, blue: 203/255))
                        .cornerRadius(10)
                    }.padding(.all)
                    
                    // phone number field
                    VStack {
                        Text("Contact Phone Number")
                            .font(.system(size: 18.0))
                            .foregroundColor(.black)
                        TextField("Phone Number", text: $phoneNumber)
                            .font(Font.system(size: 20))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    } .padding(.all)
                    
                    // dropdown menu for residence hall
                    VStack {
                        Text("Residence Hall")
                            .font(.system(size: 18.0))
                            .foregroundColor(.black)
                        DisclosureGroup("\(selectedHall)", isExpanded: $hallIsExpanded) {
                            VStack {
                                ForEach(resHall) { hall in
                                    Text("\(hall)")
                                        .font(.body)
                                        .padding(.all, 2)
                                        .onTapGesture {
                                            self.selectedHall = hall
                                            withAnimation {
                                                self.hallIsExpanded.toggle()
                                            }
                                        }
                                }
                            }
                        }.accentColor(.white)
                        .foregroundColor(.white)
                        .padding(.all, 12)
                        .background(Color(red: 0/255, green: 193/255, blue: 203/255))
                        .cornerRadius(10)
                    }.padding(.all)
                    
                    // select date form
                    VStack {
                        Text("Last Day On Campus")
                            .font(.system(size: 18.0))
                            .foregroundColor(.black)
                        DatePicker("", selection: $date, displayedComponents: .date)
                            .labelsHidden()
                            .datePickerStyle(CompactDatePickerStyle())
                    }.padding(.all)
                    .padding(.bottom)
                    
                    HStack {
                        PrimaryButton(label: "Submit a Positive Result") {
                            // connect to database
                            // send data to database
                            viewModel.showSubmittedAlert = true
                            print(self.selectedAffiliation)
                            print(self.phoneNumber)
                            print(self.selectedHall)
                            print(self.date)
                            
                            //viewModel.post()
                        }.alert(isPresented: $viewModel.showSubmittedAlert){
                            Alert(
                                title: Text("Your report has been submitted"),
                                message: Text("You will be notified once your report has been confirmed"),
                                dismissButton: .default(Text("Close"))
                            )
                        }
                    }
                }
                .padding(.vertical, -8)
                Divider()
            }.background(Color.white.ignoresSafeArea(.all, edges: .all))
            .navigationBarTitle("Self-Report", displayMode: .inline)
        }
    }
}

extension String: Identifiable {
    public var id: String {
        self
    }
}
