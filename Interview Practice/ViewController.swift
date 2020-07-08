//
//  ViewController.swift
//  Interview Practice
//
//  Created by Sean Williams on 07/07/2020.
//  Copyright © 2020 Sean Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Tuples
        
        func split(name: String) -> (first: String, last: String) {
            let split = name.components(separatedBy: " ")
            return (split[0], split[1])
        }
        
        let name = split(name: "Sean Williams")
        print(name.first)
        print(name.last)
        
        let name2 = ("sean", "Jackson")
        print(name2.0)
        print(name2.1)
        
        
        // Network Request
        imageView.frame = view.frame
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        let url = URL(string: "https://media.resources.festicket.com/www/artists/ArianaGrande.jpg")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard error == nil else {
                print(error?.localizedDescription as Any)
                return
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }.resume()

    }
    



}

