//
//  OrderStore.swift
//  DogBreeds
//
//  Created by Nisum on 6/12/18.
//  Copyright © 2018 Nisum. All rights reserved.
//

import Foundation

// MARK: - Breeds store API

protocol BreedsStoreProtocol {
    func fetchBreeds(completionHandler: @escaping ([Breed], BreedsStoreError?) -> Void)
    func fetchBredImagesURLs(forBreed breedname: String, completionHandler: @escaping ([String], BreedsStoreError?) -> Void)
}

enum BreedsStoreError: Error
{
    case CannotFetch(String)
    case CannotCreate(String)
    case CannotUpdate(String)
    case CannotDelete(String)
}
