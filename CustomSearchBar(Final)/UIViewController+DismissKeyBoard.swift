//
//  UIViewController+DismissKeyBoard.swift
//  CustomSearchBar(Final)
//
//  Created by Jeffrey Ip on 2016-07-27.
//  Copyright © 2016 RT7. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}