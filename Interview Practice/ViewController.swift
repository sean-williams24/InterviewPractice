//
//  ViewController.swift
//  Interview Practice
//
//  Created by Sean Williams on 07/07/2020.
//  Copyright © 2020 Sean Williams. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    var purrSound: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(playPurr))
        
        // FileManager
        
        if let items = try? FileManager.default.contentsOfDirectory(atPath: NSHomeDirectory()) {
            print(items)
        }
        
        var arr = [1, 2, 3, 2, 1, 2, 4]
        arr.sort()
        
        let sortedArr = arr.sorted(by: <)
        print(sortedArr)
        
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
        
        
        // Assert
        
        let tup = (1, 5, 5, 5, 6, 7, 7, 7, 5, 7, 3, 2, 5, 6, "Sean")
        assert(tup.0 == 1, "Does not equal 1")
        
        
        
        // CADisplayLink
        
        let displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink.add(to: .current, forMode: .common)
        

        
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

        swapTwoItems(&someInt, &anotherInt)
        print(someInt, anotherInt)
        swapTwoItems(&someString, &anotherString)
        print(someString, anotherString)

    }
    

    // Generics
    
    var someInt = 3
    var anotherInt = 107
    var someString = "hello"
    var anotherString = "world"
    
    func swapTwoItems<T>(_ a: inout T, _ b: inout T) {
        let tempA = b
        b = a
        a = tempA
    }
    
    
    // CADisplayLink
    
    @objc func update() {
//        print("Updating")
    }


    // AVAudioPlayer
    
    @objc func playPurr() {
        let path = Bundle.main.path(forResource: "hello.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
//        let asset = NSDataAsset(name: "hello")!
        
        do {
            purrSound = try AVAudioPlayer(contentsOf: url)
//            purrSound = try AVAudioPlayer(data: asset.data)
            purrSound?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
}



