//
//  dataModel.swift
//  AppStore
//
//  Created by user@89 on 23/10/24.
//

import UIKit

struct App {
    var title:String
    var subtitle:String
    var price:Double
    var rating:Int
    var description:String
    var id = UUID()
    var color:UIColor = randomColor
    var image:String
}

var randomColor : UIColor {
    UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
}

class DataModel {
    static var section:[Section] = [.promoted, .standard, .standard, .categories]
    
    static var apps: [App] = [
        App(title: "Zomato", subtitle: "Food Delivery", price: 0.0, rating: 5, description: "Food Delivery", image: "54074283637"),
        App(title: "Blinkit", subtitle: "Last Minute App", price: 0.0, rating: 5, description: "Food Delivery", image: "54074298457"),
        App(title: "Audible", subtitle: "Audio Books", price: 0.0, rating: 5, description: "Food Delivery", image: "54074652023"),
        App(title: "PayTM", subtitle: "Pay via Mobile", price: 0.0, rating: 5, description: "Food Delivery", image: "54074758483"),
        App(title: "Google pay", subtitle: "Payment App", price: 0.0, rating: 5, description: "Food Delivery", image: "54075729237"),
        App(title: "Maps", subtitle: "Apple Maps", price: 0.0, rating: 5, description: "Food Delivery", image: "54075811079"),]
    
    static var standardApps: [App] = [
        App(title: "Zomato", subtitle: "Food Delivery", price: 0.0, rating: 5, description: "Food Delivery", image: "54074283637"),
        App(title: "Blinkit", subtitle: "Last Minute App", price: 0.0, rating: 5, description: "Food Delivery", image: "54074298457"),
        App(title: "Audible", subtitle: "Audio Books", price: 0.0, rating: 5, description: "Food Delivery", image: "54074652023"),
        App(title: "PayTM", subtitle: "Pay via Mobile", price: 0.0, rating: 5, description: "Food Delivery", image: "54074758483"),
        App(title: "Google pay", subtitle: "Payment App", price: 0.0, rating: 5, description: "Food Delivery", image: "54075729237"),
        App(title: "Maps", subtitle: "Apple Maps", price: 0.0, rating: 5, description: "Food Delivery", image: "54075811079"),]
    
    enum Section {
        case promoted, standard, categories
    }
}

