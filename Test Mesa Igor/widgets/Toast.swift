//
//  Toast.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 03/08/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import Foundation
import UIKit

class Toast {
    
    func show(to view: UIViewController, with message: String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        view.present(alert, animated: true)

        // duration in seconds
        let duration: Double = 1

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            alert.dismiss(animated: true)
        }
    }
}
