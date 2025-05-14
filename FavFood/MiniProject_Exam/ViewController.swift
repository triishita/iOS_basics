//
//  ViewController.swift
//  MiniProject_Exam
//
//  Created by user@89 on 11/11/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var restaurants: [Restaurant] = []

    @IBOutlet weak var collectionView: UICollectionView!

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCollectionViewCell
        let restaurant = restaurants[indexPath.row]
        cell.nameLabel.text = restaurant.name
        cell.addressLabel.text = restaurant.address
        cell.typeLabel.text = restaurant.type
        cell.restaurantImageView.image = UIImage(named: restaurant.imageName)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Register the cell class or nib if needed
        //collectionView.register(UINib(nibName: "RestaurantCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RestaurantCell")

        // Set up the data source and delegate
        collectionView.dataSource = self
        collectionView.delegate = self

        // Initialize the restaurants array with sample data
        restaurants = [
            Restaurant(name: "Rich moon restaurant", address: "No.64, 1st floor, Pillayar Koil St, near Cell Point, Potheri, Kattankulathur, Tamil Nadu 603203", type: "Restaurant", imageName: "2023-12-01"), Restaurant(name: "Abode cafe", address: "R29R+235, Potheri, Kattankulathur, Tamil Nadu 603203", type: "Restaurant", imageName: "2024-06-04"), Restaurant(name: "Rajasthani Restaurant", address: "Potheri, Kattankulathur, Tamil Nadu 603203", type: "Restaurant", imageName: "2024-08-05"), Restaurant(name: "ARK Bistro", address: "No. 4, Kakkan St, above Senthil Stores, opposite to ABODE VALLEY, Potheri, Apartment, Kattankulathur, Tamil Nadu 603203", type: "Restaurant", imageName: "2024-09-24"), Restaurant(name: "HR 05 Food Plaza", address: "R2CV+52H, Unnamed Road, Pillayar Koil St, SRM Nagar, Kattankulathur, Tamil Nadu 603203", type: "Restaurant", imageName: "Z_Mee Goreng 2")
           ]
    }


}

