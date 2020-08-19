//
//  ImageUtil.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 17/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ImageUtil {

    func getImage(_ urlImage: String, _ onResult: @escaping ((UIImage) -> Void)) {
        Alamofire.request(urlImage).responseImage { response in
            if case .success(let image) = response.result {
                onResult(image)
            }
        }
    }
    
}
