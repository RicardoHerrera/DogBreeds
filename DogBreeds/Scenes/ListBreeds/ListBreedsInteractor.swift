//
//  ListBreedsInteractor.swift
//  DogBreeds
//
//  Created by Nisum on 6/12/18.
//  Copyright (c) 2018 Nisum. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListBreedsBusinessLogic
{
    func fetchBreeds(request: ListBreeds.FetchBreeds.Request)
}

protocol ListBreedsDataStore
{
    var breeds: [Breed]? {get}
}

class ListBreedsInteractor: ListBreedsBusinessLogic, ListBreedsDataStore
{
    var presenter: ListBreedsPresentationLogic?
    var worker = ListBreedsWorker(breedsStore: BreedsAPI())
    
    var breeds: [Breed]?
    
    func fetchBreeds(request: ListBreeds.FetchBreeds.Request) {
        presenter?.displayLoadingHud()
        worker.fetchBreeds { [weak self](breeds, error) in
            guard let weakSelf = self else {
                return
            }
            weakSelf.presenter?.dismissLoadingHud()
            weakSelf.breeds = breeds
            if let error = error {
                weakSelf.presenter?.displayError(error: error)
            } else {
                let response = ListBreeds.FetchBreeds.Response(breeds: breeds)
                weakSelf.presenter?.presentFetchedBreeds(response: response)
            }
        }
    }
}

