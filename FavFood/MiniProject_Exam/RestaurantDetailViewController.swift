//
//  RestaurantDetailViewController.swift
//  MiniProject_Exam
//
//  Created by user@89 on 11/11/24.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    // Outlets for UI elements
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!

    var restaurant: Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call a function to configure the view with the restaurant details
        setupView()
    }

    // Function to set up the view with the restaurant details
    private func setupView() {
        // Check that the restaurant data is available
        guard let restaurant = restaurant else { return }

        // Set the UI elements with the restaurant data
        nameLabel.text = restaurant.name
        typeLabel.text = restaurant.type
        addressLabel.text = restaurant.address
        //phoneLabel.text = restaurant.phone
        //descriptionTextView.text = restaurant.description

        // Load the restaurant image from the asset catalog
        if let image = UIImage(named: restaurant.imageName) {
            restaurantImageView.image = image
        } else {
            // Optionally, set a placeholder image if the image is not found
            restaurantImageView.image = UIImage(named: "placeholder")
        }
    }

    // Action for the Save button
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // Handle the save functionality here
        print("Save button tapped for \(restaurant?.name ?? "Unknown Restaurant")")
        // You can implement saving logic here, such as saving to a list of saved restaurants
    }

    // Action for the Favorite button
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        // Toggle the favorite status here
        print("Favorite button tapped for \(restaurant?.name ?? "Unknown Restaurant")")
        // You can change the button appearance or add logic to save to favorites
        favoriteButton.isSelected.toggle()
        let heartImage = favoriteButton.isSelected ? "heart.fill" : "heart"
        favoriteButton.setImage(UIImage(systemName: heartImage), for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail",
           let detailVC = segue.destination as? RestaurantDetailViewController,
           let selectedRestaurant = sender as? Restaurant {
            detailVC.restaurant = selectedRestaurant
        }
    }
}
