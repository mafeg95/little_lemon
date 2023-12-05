//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Mafe Garcia on 11/24/23.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    let firstName = UserDefaults.standard.string(forKey: kFirstName)
    let lastName = UserDefaults.standard.string(forKey: kLastName)
    let email = UserDefaults.standard.string(forKey: kEmail)
    
    @State var newFirstName: String = ""
    @State var newLastName: String = ""
    @State var newEmail: String = ""
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Image("Logo-small")
                    .resizable()
                    .frame(width: 130, height: 40)
                Spacer()
                Image("profile-image-placeholder")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding([.trailing], 20)
            }.padding([.top, .bottom], 10).padding([.leading], 50)
            Text("Personal information")
            Image("profile-image-placeholder").resizable().frame(width: 100, height: 100)
            Text("First Name")
                .frame(width: 345, alignment: .leading)
                .padding([.top], 11)
                .font(Font.custom("Karla-Regular", size: 20))
                .foregroundColor(Color("TextBlack"))
            TextField(firstName ?? "Last Name",
                      text: $newFirstName,
                      prompt: Text(firstName ?? "First Name Here")
                        .font(Font.custom("Karla-Regular", size: 20))
                        .foregroundColor(Color("TextBlack"))
                    )
                    .padding(8)
                    .font(Font.custom("Karla-Regular", size: 20))
                    .foregroundColor(Color("TextBlack"))
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                    )
            Text("Last Name")
                .frame(width: 345, alignment: .leading)
                .padding([.top], 11)
                .font(Font.custom("Karla-Regular", size: 20))
                .foregroundColor(Color("TextBlack"))
            TextField(lastName ?? "Last Name",
                      text: $newLastName,
                      prompt: Text(lastName ?? "Last Name Here")
                        .font(Font.custom("Karla-Regular", size: 20))
                        .foregroundColor(Color("TextBlack"))
                    )
                    .padding(8)
                    .font(Font.custom("Karla-Regular", size: 20))
                    .foregroundColor(Color("TextBlack"))
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                    )
            Text("Email")
                .frame(width: 345, alignment: .leading)
                .padding([.top], 11)
                .font(Font.custom("Karla-Regular", size: 20))
                .foregroundColor(Color("TextBlack"))
            TextField(email ?? "Email",
                      text: $newEmail,
                      prompt: Text(email ?? "Email Here")
                        .font(Font.custom("Karla-Regular", size: 20))
                        .foregroundColor(Color("TextBlack"))
                    )
                    .padding(8)
                    .font(Font.custom("Karla-Regular", size: 20))
                    .foregroundColor(Color("TextBlack"))
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                    )
            VStack{
                Button("Save Changes"){
                    UserDefaults.standard.set(newFirstName, forKey: kFirstName)
                    UserDefaults.standard.set(newLastName, forKey: kLastName)
                    UserDefaults.standard.set(newEmail, forKey: kEmail)
                }.padding([.top, .bottom], 15)
                    .padding([.trailing, .leading], 80)
                    .background(Color("YellowColor"))
                    .cornerRadius(10)
                    .padding(20)
                    .font(Font.custom("Karla-Regular", size: 19))
                    .foregroundColor(Color("TextBlack"))
                Button("Logout"){
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    self.presentation.wrappedValue.dismiss()
                }.padding([.top, .bottom], 15)
                    .padding([.trailing, .leading], 110)
                    .background(Color("GreenColor"))
                    .cornerRadius(10)
                    .font(Font.custom("Karla-Regular", size: 19))
                    .foregroundColor(Color("TextWhite"))
            }
        }.padding([.trailing, .leading], 20)
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
