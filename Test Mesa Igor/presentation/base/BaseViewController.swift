//
//  BaseViewController.swift
//  Test Mesa Igor
//
//  Created by Igor Melo on 19/07/20.
//  Copyright © 2020 Eihror. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBinding()
        setupView()
        setupObservable()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupToolbar(
        backgroundColor: UIColor = Colors.stratos,
        isTranslucent: Bool = false,
        titleAttrs: [NSAttributedString.Key : Any] = [NSAttributedString.Key : Any](),
        title: String = "",
        isGonnaHaveLeftButton: Bool = false,
        leftButtonAction: Selector? = nil
    ) {
        self.navigationController!.navigationBar.barTintColor = backgroundColor
        self.navigationController!.navigationBar.isTranslucent = isTranslucent
        if !titleAttrs.isEmpty {
            self.navigationController!.navigationBar.titleTextAttributes = titleAttrs
        }
        self.navigationItem.title = title
        
        if (isGonnaHaveLeftButton) {
            let leftButton = UIBarButtonItem(image: UIImage(named: "close"), style: .plain, target: self, action: leftButtonAction)
            self.navigationItem.leftBarButtonItem = leftButton
            self.navigationItem.leftBarButtonItem?.tintColor = Colors.white
        }
    }
    
    func setupBinding() {}
    func setupView() {}
    func setupObservable() {}
}
