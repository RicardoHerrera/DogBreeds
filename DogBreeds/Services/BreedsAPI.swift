//
//  BreedsAPI.swift
//  DogBreeds
//
//  Created by Nisum on 6/12/18.
//  Copyright © 2018 Nisum. All rights reserved.
//

import Foundation

class BreedsAPI: BreedsStoreProtocol {
    
    // MARK: - operations - Optional error
    
    func fetchBreeds(completionHandler: @escaping ([Breed], BreedsStoreError?) -> Void)
    {
        //creating a NSURL
        let url = NSURL(string: "https://dog.ceo/api/breeds/list")
        let errorMessage = "Cannot fetch breeds"
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if error != nil {
                completionHandler([], BreedsStoreError.CannotFetch(errorMessage))
            }
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                // Validate response
                if (jsonObj!.value(forKey: "status")! as! String) != "success" {
                    completionHandler([], BreedsStoreError.CannotFetch(errorMessage))
                }
                
                //getting the avengers tag array from json and converting it to NSArray
                if let breedArray = jsonObj!.value(forKey: "message") as? NSArray {
                    var breedsObjectArray: [Breed] = []
                    for breed in breedArray {
                        breedsObjectArray.append(Breed(name: breed as! String))
                    }
                    completionHandler(breedsObjectArray, nil)
                } else {
                    completionHandler([], BreedsStoreError.CannotFetch(errorMessage))
                }
            }
        }).resume()
    }
    
    func fetchBredImagesURLs(forBreed breedname: String, completionHandler: @escaping ([String], BreedsStoreError?) -> Void) {
        // Crating NSURL for images urls
        let url = NSURL(string: "https://dog.ceo/api/breed/\(breedname)/images")
        let errorMessage = "Cannot fetch breeds URLs"
        //fetching the data from the url
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if error != nil {
                completionHandler([], BreedsStoreError.CannotFetch(errorMessage))
            }
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                // Validate response
                if (jsonObj!.value(forKey: "status")! as! String) != "success" {
                    completionHandler([], BreedsStoreError.CannotFetch(errorMessage))
                }
                
                //getting the avengers tag array from json and converting it to NSArray
                if let breedArray = jsonObj!.value(forKey: "message") as? NSArray {
                    var breedsObjectArray: [String] = []
                    for breedURLs in breedArray {
                        breedsObjectArray.append(breedURLs as! String)
                    }
                    completionHandler(breedsObjectArray, nil)
                } else {
                    completionHandler([], BreedsStoreError.CannotFetch(errorMessage))
                }
            }
        }).resume()
    }
}

