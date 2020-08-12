//
//  ViewController.swift
//  Interview Practice
//
//  Created by Sean Williams on 07/07/2020.
//  Copyright © 2020 Sean Williams. All rights reserved.
//

import AVFoundation
import GameplayKit
import Lottie
import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    var helloWorld: AVAudioPlayer?
    let sean = User(name: "Sean")


    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(playAudio))
        
        // Lottie Animations
        
        let starAnimationView = AnimationView(name: "StarAnimation")
        starAnimationView.backgroundColor = .blue
        starAnimationView.play(fromFrame: 24, toFrame: 48)
        starAnimationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(starAnimationView)
        
        starAnimationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        starAnimationView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        starAnimationView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        starAnimationView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        // NSAttibutedString
        
        let fullString = NSMutableAttributedString(string: "Start of text")
        
        let imageAttachment = NSTextAttachment()
        let seanImage = UIImage(named: "sean")
        imageAttachment.image = seanImage
        
        let imageString = NSAttributedString(attachment: imageAttachment)
        fullString.append(imageString)
        fullString.append(NSAttributedString(string: "End of text"))
        
        let label = UILabel()
        view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .cyan
        
//        label.attributedText = fullString
        
    
        // Enum associated values
        
        let paigntonWeather = Weather.sunny(temp: 25)
        print(paigntonWeather)
        let londonWeather = Weather.raining(amount: "Heavy")
        print("Weather in London is \(londonWeather)")
        
        
        // ARC
        
        title = sean.name
        
        do {
            let john = User(name: "John")
            john.name = "Jonathan"
        }
        
        
        // Caching
        
        let cache = NSCache<NSString, ExpensiveObjectClass>()
        let myObject: ExpensiveObjectClass
        
        if let cachedVersion = cache.object(forKey: "CachedObject") {
            myObject = cachedVersion
        } else {
            myObject = ExpensiveObjectClass()
            cache.setObject(myObject, forKey: "CachedObject")
        }
        
        
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
        
//        let displayLink = CADisplayLink(target: self, selector: #selector(update))
//        displayLink.add(to: .current, forMode: .common)
        

        
        // Network Request
//        imageView.frame = view.frame
//        imageView.backgroundColor = .red
//        imageView.contentMode = .scaleAspectFill
//        view.addSubview(imageView)
//
//        let url = URL(string: "https://media.resources.festicket.com/www/artists/ArianaGrande.jpg")
//
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            guard error == nil else {
//                print(error?.localizedDescription as Any)
//                return
//            }
//
//            if let data = data {
//                DispatchQueue.main.async {
//                    self.imageView.image = UIImage(data: data)
//                }
//            }
//        }.resume()

        swapTwoItems(&someInt, &anotherInt)
        print(someInt, anotherInt)
        swapTwoItems(&someString, &anotherString)
        print(someString, anotherString)

//        view.bringSubviewToFront(label)
        
        print(sum(2, 5, 8))
        
        

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
    
    @objc func playAudio() {
        let path = Bundle.main.path(forResource: "hello.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            helloWorld = try AVAudioPlayer(contentsOf: url)
            helloWorld?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    // variadic functions
    
    func sum(_ nums: Int...) -> Int {
        return nums.reduce(0, +)
    }
}



class ExpensiveObjectClass {
    
}

struct lovely {
    let cat = 4
    var dog = "Barry"
}
