//
//  LoginView.swift
//  COVID Lens
//

import SwiftUI

struct LoginView : View {
    
    @State var email = ""
    @State var password = ""
    
    //@State var user1 : User?
    
    // functions
    // verify credentials with database ?
    
    
    var body: some View{
        
        NavigationView{
            
            VStack{
                
                Spacer(minLength: 0)
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.vertical)
                
                Text("COVID Lens")
                    .font(.largeTitle).foregroundColor(.black)
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 12, content: {
                        
                        Text("Login")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.black)
                        
                        Text("Please sign in to continue")
                            .foregroundColor(Color.black.opacity(0.5))
                    })
                    
                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.leading,15)
                
                HStack{
                    
                    Image(systemName: "envelope")
                        .font(.title2)
                        .foregroundColor(.black)
                        .frame(width: 35)
                    
                    TextField("EMAIL", text: $email)
                        .autocapitalization(.none)
                }
                .padding()
                .background(Color.white.opacity(email == "" ? 0 : 0.12))
                .cornerRadius(15)
                .padding(.horizontal)
                
                HStack{
                    
                    Image(systemName: "lock")
                        .font(.title2)
                        .foregroundColor(.black)
                        .frame(width: 35)
                    
                    SecureField("PASSWORD", text: $password)
                        .autocapitalization(.none)
                }
                .padding()
                .background(Color.black.opacity(password == "" ? 0 : 0.12))
                .cornerRadius(15)
                .padding(.horizontal)
                
                HStack(spacing: 15){
                    
                    Text("LOGIN")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 175)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        
                        
                        .opacity(email != "" && password != "" ? 1 : 0.5)
                        .disabled(email != "" && password != "" ? false : true)
                }
                .padding(.top).onTapGesture {
                    // do stuff
                }
                
                // Forget password Button...
                
                Button(action: {}, label: {
                    Text("Forget password?")
                        .foregroundColor(Color.black)
                    
                })
                .padding(.top,8)
                
                // SignUp...
                
                Spacer(minLength: 0)
                
                HStack(spacing: 5){
                    
                    Text("Don't have an account? ")
                        .foregroundColor(Color.black.opacity(0.6))
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Signup")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                    }
                }
                .padding(.vertical)
            }
            .background(Color.white.ignoresSafeArea(.all, edges: .all))
            .animation(.easeOut)
        }
        
    }
    
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
}
