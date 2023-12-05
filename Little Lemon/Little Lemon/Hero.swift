//
//  Hero.swift
//  Little Lemon
//
//  Created by Mafe Garcia on 11/29/23.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Text("Little Lemon")
                    .font(Font.custom("MarkaziText-Medium", size: 60))
                    .padding([.bottom], -19)
                    .foregroundColor(Color("YellowColor"))
                Text("Chicago")
                    .font(Font.custom("MarkaziText-Regular", size: 40))
                    .padding([.top], -11)
                    .foregroundColor(Color("TextWhite"))
                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                    .font(Font.custom("Karla-Regular", size: 17))
                    .padding([.trailing], 150)
                    .foregroundColor(Color("TextWhite"))
            }
            Image("toasts-small")
                .resizable()
                .frame(width: 110, height: 130)
                .cornerRadius(10)
                .padding([.top], 55)
                .padding([.leading], 250)
        }.padding(20).background(Color("GreenColor"))
        
    }
}

struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero()
    }
}
