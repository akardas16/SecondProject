//
//  MyNavView.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 1.05.2022.
//

import SwiftUI
import UIKit

struct MyNavView: View {
    
    let items: [BottomBarItem] = [BottomBarItem(icon: "phone", title: "Phone", color: .purple),BottomBarItem(icon: "heart", title: "Likes", color: .pink),BottomBarItem(icon: "magnifyingglass", title: "Search", color: .orange),BottomBarItem(icon: "person", title: "Profile", color: .blue)]
    
    @State private var selectedIndex: Int = 0

       var selectedItem: BottomBarItem {
           items[selectedIndex]
       }
    var body: some View {
        NavigationView {
          
                   VStack {
                       if selectedIndex == 0{
                           BasicView(item: selectedItem)
                              .navigationBarHidden(true)
                       }else if selectedIndex == 1 {
                           SecondSwiftUI().navigationBarHidden(true)
                       }else if selectedIndex == 2 {
                           BasicView(item: selectedItem)
                              .navigationBarHidden(true)
                           
                       }else if selectedIndex == 3 {
                           SecondSwiftUI().navigationBarHidden(true)
                       }
                    
                       Spacer()
                       BottomBar(selectedIndex: $selectedIndex, items: items).background(.blue.opacity(0.2)).frame(height:36).padding(.top,8)
                   }
        }.navigationBarHidden(true)
    }
}

struct MyNavView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavView()
            .preferredColorScheme(.dark)
    }
}

struct BasicView: View {
    let item: BottomBarItem

    var detailText: String {
    "\(item.title) Detail"
}

var body: some View {
    VStack {
       


        List{
            ForEach(0..<20) { index in
                VStack {
                    Text("Developed by Bezhan Odinaev")
                        .font(.headline)
                        .foregroundColor(item.color)

                    Text("@smartvipere75")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }.listStyle(PlainListStyle())
        

       
        }
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
