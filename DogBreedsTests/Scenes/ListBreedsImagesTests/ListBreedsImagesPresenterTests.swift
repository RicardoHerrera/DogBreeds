//
//  ListBreedsImagesPresenterTests.swift
//  DogBreeds
//
//  Created by Nisum on 6/13/18.
//  Copyright (c) 2018 Nisum. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import DogBreeds
import XCTest

class ListBreedsImagesPresenterTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: ListBreedsImagesPresenter!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupListBreedsImagesPresenter()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupListBreedsImagesPresenter()
    {
        sut = ListBreedsImagesPresenter()
    }
    
    // MARK: Test doubles
    
    class ListBreedsImagesDisplayLogicSpy: ListBreedsImagesDisplayLogic
    {
        var storageBreedImagesURLsCalled = false
        func storageBreedImagesURLs(response: ListBreedsImages.FetchImagesURLs.ViewModel) {
            storageBreedImagesURLsCalled = true
        }
    }
    
    // MARK: Tests
    
    func testStorageBreedImagesURLsShouldAskViewControllerToStorageFetchedURLs()
    {
        // Given
        let listBreedURLsDisplayLogicSpy = ListBreedsImagesDisplayLogicSpy()
        sut.viewController = listBreedURLsDisplayLogicSpy
        
        // When
        let response = ListBreedsImages.FetchImagesURLs.Response(breedImagesURLs: [], error: nil)
        sut.storageBreedImagesURLs(response: response)
        
        // Then
        XCTAssert(listBreedURLsDisplayLogicSpy.storageBreedImagesURLsCalled, "Storage fetched URLs should ask view controller to storage them")
    }
}


