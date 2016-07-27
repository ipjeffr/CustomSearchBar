//
//  CustomSearchField.swift
//  CustomSearchBar(Final)
//
//  Created by Jeffrey Ip on 2016-07-27.
//  Copyright © 2016 RT7. All rights reserved.
//

import UIKit

class CustomSearchField: UITextField {

    override func leftViewRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectMake(8, 8, 30, 30)
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 42, 10)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 42, 10)
    }

}
