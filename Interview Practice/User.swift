//
//  User.swift
//  Interview Practice
//
//  Created by Sean Williams on 03/08/2020.
//  Copyright © 2020 Sean Williams. All rights reserved.
//

import Foundation

class User {
    var name: String
    
    init(name: String) {
        self.name = name
        print("user initialized with name: \(name)")
    }
    
    deinit {
        print("Deallocating user: \(name)")
        
    }
}


enum Weather {
    case cloudy(coverage: String)
    case sunny(temp: Int)
    case raining(amount: String)
    case windy(type: String)
}


enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}
