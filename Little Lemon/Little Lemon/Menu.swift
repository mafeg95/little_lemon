//
//  Menu.swift
//  Little Lemon
//
//  Created by Mafe Garcia on 11/24/23.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText = ""
    
    func buildSortDescriptors() -> [NSSortDescriptor]{
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate{
        if searchText != ""{
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        } else{
            return NSPredicate(value: true)
        }
    }
    
    func getMenuData(){
        PersistenceController.shared.clear()
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                do {
                    if let data = data {
//                        let newData = Data(string.utf8)
                        let decoder = JSONDecoder()
                        let menuItems = try decoder.decode(MenuList.self, from: data)
                        let menu = menuItems.menu
                        for item in menu {
                            let dish = Dish(context: viewContext)
                            dish.price = item.price
                            dish.title = item.title
                            dish.image = item.image
                            dish.descriptionText = item.descriptionText
                            try? viewContext.save()
                        }
                    }
                }catch{
                    
                }
            }
        task.resume()
    }
    
    var body: some View {
        VStack{
            HStack{
                EmptyView()
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
            
            Hero().padding([.bottom], -10)
            HStack{
                Image(systemName: "magnifyingglass")
                    .padding(6)
                    .background(Color("TextWhite"))
                    .cornerRadius(100)
                TextField("",
                          text: $searchText,
                          prompt: Text("Search menu")
                                .font(Font.custom("Karla-Regular", size: 16))
                                .foregroundColor(Color("TextWhite"))
                ).foregroundColor(Color("TextWhite"))
                    .font(Font.custom("Karla-Regular", size: 16))
            }.padding(15).background(Color("GreenColor"))
            FetchedObjects(
                predicate: buildPredicate(),
                sortDescriptors: buildSortDescriptors()
            ) { (dishes: [Dish]) in
                List{
                    ForEach(dishes) { dish in
                        HStack{
                            VStack(alignment: .leading){
                                Text(dish.title ?? "")
                                    .font(Font.custom("Karla-Bold", size: 14))
                                    .padding([.bottom], -0.5)
                                Text(dish.descriptionText ?? "").lineLimit(2)
                                    .font(Font.custom("Karla-Regular", size: 13))
                                    .padding([.top, .bottom], 0.5)
                                    .padding([.trailing], 17)
                                Text(dish.price).font(Font.custom("Karla-Regular", size: 15))
                            }
                            Spacer()
                            AsyncImage(url: URL(string: dish.image ?? "")){ image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }.frame(width: 70, height: 70)
                        }
                    }
                }.listStyle(.plain)
            }
        }.onAppear(perform: getMenuData)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
