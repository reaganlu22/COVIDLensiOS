//
//  SelfReportView.swift
//  COVID Lens
//
//  Created by Seth Goodwin on 10/7/20.
//
import UserNotifications
import SwiftUI
@available(iOS 14.0, *)

struct SelfReportView: View {
    
    @StateObject private var viewModel = SelfReportVM()
    
    // assign to view model
    @State private var affilIsExpanded: Bool = false
    @State private var selectedAffiliation: String = ""
    @State private var phoneNumber: String = ""
    @State private var date = Date()
    @State private var hallIsExpanded: Bool = false
    @State private var selectedHall: String = ""
    @State private var description: String = ""
    @State var lastSubmittedDate: Date = Date()
    @State var canSubmit: Bool?
    
    var body: some View {
        NavigationView {
            VStack {
                
                ScrollView {
                    // self-report instructions
                    TabInfoView(icon: viewModel.icon, title: viewModel.title, info: viewModel.info, disclaimer: viewModel.disclaimer)
                    
                    VStack {
                        Text("University Affiliation")
                            .font(.system(size: 18.0))
                            .foregroundColor(.black)
                            + Text(" *")
                            .font(.system(size: 18.0))
                            .foregroundColor(.red)
                            .baselineOffset(1.0)
                        
                        // dropdown menu for campus affiliation
                        DisclosureGroup("\(selectedAffiliation)", isExpanded: $affilIsExpanded) {
                            VStack {
                                ForEach(viewModel.affiliations) { affil in
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
                            + Text(" *")
                            .font(.system(size: 18.0))
                            .foregroundColor(.red)
                            .baselineOffset(1.0)
                        TextField("Phone Number", text: $phoneNumber)
                            .font(Font.system(size: 20))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    } .padding(.all)
                    
                    // dropdown menu for residence hall
                    VStack {
                        Text("Residence Hall")
                            .font(.system(size: 18.0))
                            .foregroundColor(.black)
                            + Text(" *")
                            .font(.system(size: 18.0))
                            .foregroundColor(.red)
                            .baselineOffset(1.0)
                        DisclosureGroup("\(selectedHall)", isExpanded: $hallIsExpanded) {
                            VStack {
                                ForEach(viewModel.resHall) { hall in
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
                            + Text(" *")
                            .font(.system(size: 18.0))
                            .foregroundColor(.red)
                            .baselineOffset(1.0)
                        DatePicker("", selection: $date, in: ...Date(), displayedComponents: .date)
                            .labelsHidden()
                            .datePickerStyle(CompactDatePickerStyle())
                    }.padding(.all)
                    
                    // additional description textbox
                    VStack {
                        Text("Additional Info/Description")
                            .font(.system(size: 18.0))
                            .foregroundColor(.black)
                        TextEditor(text: $description)
                            .font(Font.system(size: 20))
                            .cornerRadius(12)
                    }.padding(.all)
                    .padding(.bottom)
                    
                    HStack {
                        PrimaryButton(label: "Submit a Positive Result") {
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd"
                            let today = Date()
                            var canSubmit = true
                            
                            // check if all required fields are filled out
                            if(self.selectedAffiliation != "" && self.phoneNumber != "" && self.selectedHall != "" ) {
                                // first time submitting a report
                                if (UserDefaults.standard.string(forKey: "lastSubmittedDate") == nil) {
                                    UserDefaults.standard.setValue(dateFormatter.string(from: today), forKey: "lastSubmittedDate")
                                } else {
                                    self.lastSubmittedDate = dateFormatter.date(from: UserDefaults.standard.string(forKey: "lastSubmittedDate")!)!
                                    canSubmit = Calendar.current.dateComponents([.day], from: lastSubmittedDate, to: today).day! >= viewModel.twoWeeks
                                    
                                    let daysLeft  = viewModel.twoWeeks - Calendar.current.dateComponents([.day], from: lastSubmittedDate, to: today).day!
                                    
                                    if (daysLeft == 0) {
                                        UserDefaults.standard.setValue(nil, forKey: "lastSubmittedDate")
                                    }
                                }
                                
                                if (canSubmit) {
                                    // database post report info
                                    viewModel.activeAlert = .valid
                                } else {
                                    viewModel.activeAlert = .tooSoon
                                }
                            } else {
                                viewModel.activeAlert = .invalid
                            }
                            viewModel.showAlert.toggle()
                        }
                    }
                }
                .padding(.vertical, -8)
                Divider()
            }.background(Color.white.ignoresSafeArea(.all, edges: .all)).onTapGesture {
                self.hideKeyboard()
            }
            .navigationBarTitle("Self-Report", displayMode: .inline)
            .alert(isPresented: $viewModel.showAlert) {
                switch viewModel.activeAlert {
                case .valid:
                    return Alert(
                        title: Text("Report Submitted"),
                        message: Text("You will be notified once your report has been confirmed"),
                        dismissButton: .default(Text("OK"))
                    )
                case .invalid:
                    return Alert(
                        title: Text("Report Not Submitted"),
                        message: Text("Please ensure all required fields are filled out"),
                        dismissButton: .default(Text("OK"))
                    )
                case .tooSoon:
                    return Alert(
                        title: Text("Report Not Submitted"),
                        message: Text("You can only sumbit a report once every 14 days"),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
    }
}

enum ActiveAlert {
    case valid, invalid, tooSoon
}

extension String: Identifiable {
    public var id: String {
        self
    }
}
