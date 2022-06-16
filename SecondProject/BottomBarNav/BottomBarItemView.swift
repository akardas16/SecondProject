//
//  BottomBarItemView.swift
//  BottomBar
//
//  Created by Bezhan Odinaev on 7/2/19.
//  Copyright © 2019 Bezhan Odinaev. All rights reserved.
//

import SwiftUI

public struct BottomBarItemView: View {
    @Binding var selected : Int
    public let index: Int
    public let item: BottomBarItem
    
    public var body: some View {
        HStack {
            item.icon
                .imageScale(.large)
                .foregroundColor(isSelected ? item.color : .primary)
            
            if isSelected {
                Text(item.title)
                    .foregroundColor(item.color)
                    .font(.caption)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
        }
        .padding(.horizontal,12).padding(.vertical,8)
        .background(
            Capsule()
                .fill(isSelected ? item.color.opacity(0.2) : Color.clear)
        ).animation(Animation.easeOut(duration: 0.6), value: isSelected)
    }
    
    var isSelected : Bool{
        selected == index
    }
    
}
