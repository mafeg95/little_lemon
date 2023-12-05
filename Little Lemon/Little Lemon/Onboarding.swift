//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Mafe Garcia on 11/24/23.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationView{
            
            VStack{
                NavigationLink(destination: Home(), isActive: $isLoggedIn){
                    EmptyView()
                }
                Image("Logo-small")
                    .resizable()
                    .frame(width: 130, height: 40)
                Hero()
                VStack(alignment: .leading){
                    Text("First Name*")
                        .padding([.top, .bottom],9)
                        .font(Font.custom("Karla-Regular", size: 20))
                        .foregroundColor(Color("TextBlack"))
                    
                    TextField("",
                              text: $firstName,
                              prompt: Text("Text Here")
                                .font(Font.custom("Karla-Regular", size: 20))
                                .foregroundColor(Color.gray)
                            )
                            .padding(8)
                            .font(Font.custom("Karla-Regular", size: 20))
                            .foregroundColor(Color("TextBlack"))
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                            )
                    
                    Text("Last Name*")
                        .padding([.top, .bottom],9)
                        .font(Font.custom("Karla-Regular", size: 20))
                        .foregroundColor(Color("TextBlack"))
                    
                    TextField("",
                              text: $lastName,
                              prompt: Text("Text Here")
                                .font(Font.custom("Karla-Regular", size: 20))
                                .foregroundColor(Color.gray)
                            )
                            .padding(8)
                            .font(Font.custom("Karla-Regular", size: 20))
                            .foregroundColor(Color("TextBlack"))
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                            )
                    
                    Text("Email*")
                        .padding([.top, .bottom],9)
                        .font(Font.custom("Karla-Regular", size: 20))
                        .foregroundColor(Color("TextBlack"))
                    
                    TextField("",
                              text: $email,
                              prompt: Text("Text Here")
                                .font(Font.custom("Karla-Regular", size: 20))
                                .foregroundColor(Color.gray)
                            )
                            .padding(8)
                            .font(Font.custom("Karla-Regular", size: 20))
                            .foregroundColor(Color("TextBlack"))
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                            )
                    
                }.padding([.leading, .trailing], 20)
                Button("Register"){
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        isLoggedIn = true
                    } else{
                        
                    }
                }.padding([.top, .bottom], 15)
                    .padding([.trailing, .leading], 30)
                    .background(Color("SecDark"))
                    .cornerRadius(10)
                    .padding(70)
                    .font(Font.custom("Karla-Regular", size: 19))
                    .foregroundColor(Color("TextWhite"))
            }.onAppear(){
                if UserDefaults.standard.bool(forKey: kIsLoggedIn){
                    isLoggedIn = true
                }
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
