//
//  Breed.swift
//  DogBreeds
//
//  Created by Nisum on 6/12/18.
//  Copyright © 2018 Nisum. All rights reserved.
//

import Foundation

struct Breed: Equatable {
    
    // MARK: - Basic Breed Info
    var name: String
}

func ==(lhs: Breed, rhs: Breed) -> Bool
{
    return lhs.name == rhs.name
}
