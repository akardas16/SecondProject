//
//  Extensions.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 16.04.2022.
//

import Foundation

//Usage
//yourDate.getFormattedDate(style: .medium) //try medium, short, full, long
//OR
//yourDate.getFormattedDate(format: "yyyy/MM/dd HH:mm:ss")
extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
    
    func getFormattedDate(style: DateFormatter.Style) -> String {
         let dateformat = DateFormatter()
         dateformat.dateStyle = style
         return dateformat.string(from: self)
     }
}
