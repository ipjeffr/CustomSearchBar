//
//  ViewController.swift
//  CustomSearchBar(Final)
//
//  Created by Jeffrey Ip on 2016-07-27.
//  Copyright © 2016 RT7. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var searchField: CustomSearchField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var navButton: UIButton!
    @IBOutlet weak var xButton: UIButton!
    
    @IBOutlet var searchFieldTrailingConstraint: NSLayoutConstraint! //strong reference for animation reasons
    var searchFieldCompressedTrailingConstraint: NSLayoutConstraint?
    
    @IBOutlet var searchContainerTopConstraint: NSLayoutConstraint!
    var searchContainerMovedUpTopConstraint: NSLayoutConstraint?
    
    var isSearchFieldCompressed: Bool = false //boolean value to keep track of searchField visual state
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        //initially hide cancel and x buttons
        cancelButton.hidden = true
        xButton.hidden = true
        
        searchField.delegate = self //set this viewcontroller as searchfield delegate
        searchField.layer.cornerRadius = 20.0
        searchField.layer.borderColor = UIColor.blackColor().CGColor
        searchField.layer.borderWidth = 1.0
        
        let magnifyGlass = CustomGraphics().drawMagnifyGlass()
        let magnifyGlassView = UIImageView()
        magnifyGlassView.image = magnifyGlass
        searchField.leftView = magnifyGlassView
        searchField.leftViewMode = .Always
        
        searchField.addSubview(filterButton)
        searchField.addSubview(navButton)
        searchField.addSubview(xButton)
        
        filterButton.backgroundColor = UIColor.blackColor()
        filterButton.clipsToBounds = true
        
        let navArrowBlue = CustomGraphics().drawNavArrow(UIColor.blueColor().CGColor)
        let navArrowRed = CustomGraphics().drawNavArrow(UIColor.redColor().CGColor)
        navButton.imageView?.contentMode = .Center
        navButton.setImage(navArrowBlue, forState: .Normal) //make button type Custom in IB
        navButton.setImage(navArrowRed, forState: .Highlighted)
        navButton.setImage(navArrowRed, forState: .Selected)
        navButton.adjustsImageWhenHighlighted = false
        
        let xButtonImage = CustomGraphics().drawXButton()
        xButton.imageView?.contentMode = .Center
        xButton.setImage(xButtonImage, forState: .Normal)
        xButton.adjustsImageWhenHighlighted = false
    }

    //TextField/SearchField delegate methods
    @IBAction func textFieldDidChange(sender: CustomSearchField) {

        let searchString = self.searchField!.text
        if (searchString == "") {
            if self.isSearchFieldCompressed == true {
                self.xButton?.hidden = true
            }
        } else {
            if self.isSearchFieldCompressed == true {
                self.xButton?.hidden = false
            } else {
                self.xButton?.hidden = true
            }
        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.searchField.translatesAutoresizingMaskIntoConstraints = false
        self.cancelButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.layoutIfNeeded()
        UIView.animateWithDuration(0.2, animations:  {
            
            //raise search container to top of view
            self.searchContainerTopConstraint.active = false
            self.searchContainerMovedUpTopConstraint = NSLayoutConstraint(item: self.searchContainerView,
                attribute: .Top,
                relatedBy: .Equal,
                toItem: self.view,
                attribute: .Top,
                multiplier: 1.0,
                constant: 20)
            self.searchContainerMovedUpTopConstraint?.active = true
            
            //compress the searchField, hide the nav and filter buttons, show cancel button
            self.searchFieldTrailingConstraint.active = false
            self.searchFieldCompressedTrailingConstraint = NSLayoutConstraint(item: self.searchField,
                attribute: .Trailing,
                relatedBy: .Equal,
                toItem: self.cancelButton,
                attribute: .Leading,
                multiplier: 1.0,
                constant: -8.0)
            self.searchFieldCompressedTrailingConstraint?.active = true
            
            self.view.layoutIfNeeded() //necessary to animate properly
            
            }, completion: {
                _ in
                self.filterButton?.hidden = true
                self.navButton?.hidden = true
                self.cancelButton?.hidden = false
                self.isSearchFieldCompressed = true
        })
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.searchField?.resignFirstResponder()
        return true
    }
    
    //Button Actions related to TextField/SearchField
    @IBAction func didPressCancelButton(sender: UIButton) {
        
        self.view.layoutIfNeeded()
        UIView.animateWithDuration(0.2, animations:  {
            self.searchField?.resignFirstResponder()
            self.searchField!.text = ""
            self.searchContainerMovedUpTopConstraint?.active = false
            self.searchContainerTopConstraint.active = true
            self.cancelButton?.hidden = true
            self.searchFieldCompressedTrailingConstraint?.active = false
            self.searchFieldTrailingConstraint.active = true
            self.xButton.hidden = true
            self.view.layoutIfNeeded()
            }, completion:  {
                _ in
                self.filterButton?.hidden = false
                self.navButton?.hidden = false
                self.isSearchFieldCompressed = false
        })
    }
    
    @IBAction func didPressXButton(sender: UIButton) {
        self.searchField!.text = ""
        xButton?.hidden = true
    }
    
    @IBAction func didPressNavButton(sender: UIButton) {
        //TODO: Change color of image --> or just swap image
        navButton.selected = !navButton.selected
    }
    
}