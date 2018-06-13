//
//  BreedImageTableViewCell.swift
//  DogBreeds
//
//  Created by Nisum on 6/13/18.
//  Copyright © 2018 Nisum. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class BreedImageTableViewCell: UITableViewCell {
    class var ReuseIdentifier: String { return "BreedImageTableViewCell" }
    
    @IBOutlet weak var breedImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with URLString: String, placeholderImage: UIImage) {
        let size = breedImage.frame.size
        
        breedImage?.af_setImage(
            withURL: URL(string: URLString)!,
            placeholderImage: placeholderImage,
            filter: AspectScaledToFillSizeWithRoundedCornersFilter(size: size, radius: 20.0),
            imageTransition: .crossDissolve(0.2)
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        breedImage?.af_cancelImageRequest()
        breedImage?.layer.removeAllAnimations()
        breedImage?.image = nil
    }
}
