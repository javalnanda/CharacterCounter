//
//  ViewController.swift
//  CharacterCounterExample
//
//  Created by Javal Nanda on 08/09/19.
//  Copyright © 2019 Javal Nanda. All rights reserved.
//

import UIKit
import CharacterCounter

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textFieldWithCounterAccessoryView: UITextField!
    @IBOutlet weak var textViewWithCounterAccessoryView: UITextView!
    @IBOutlet weak var textFieldWithoutAccessoryView: UITextField!
    @IBOutlet weak var textViewWithoutAccessoryView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Add Character counter as accessory view for UITextField
        textFieldWithCounterAccessoryView.inputAccessoryView = CharacterCounter(textInput: textFieldWithCounterAccessoryView, maxCharacterLimit: 5)

        //Add Character counter as accessory view for UITextView
        textViewWithCounterAccessoryView.inputAccessoryView = CharacterCounter(textInput: textViewWithCounterAccessoryView, maxCharacterLimit: 10)

        //Add character counter for textfield to view and customize it as needed
        let counterWithoutAccessory = CharacterCounter(textInput: textFieldWithoutAccessoryView, maxCharacterLimit: 5, useAsAccessoryView: false)
        self.view.addSubview(counterWithoutAccessory)
        counterWithoutAccessory.textColorWithinLimit = UIColor.black
        counterWithoutAccessory.textColorForMaxLimit = UIColor.orange
        counterWithoutAccessory.counterLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        counterWithoutAccessory.accessibilityLabel = "textFieldCounter"

        self.view.addConstraints([
            NSLayoutConstraint(item: counterWithoutAccessory, attribute: .leading, relatedBy: .equal, toItem: textFieldWithoutAccessoryView, attribute: .leading, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: counterWithoutAccessory, attribute: .trailing, relatedBy: .equal, toItem: textFieldWithoutAccessoryView, attribute: .trailing, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: counterWithoutAccessory, attribute: .top, relatedBy: .equal, toItem: textFieldWithoutAccessoryView, attribute: .bottom, multiplier: 1.0, constant: 5),
            NSLayoutConstraint(item: counterWithoutAccessory, attribute: .bottom, relatedBy: .equal, toItem: textViewWithoutAccessoryView, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: counterWithoutAccessory, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 45)
            ])

        //Add character counter for textView to view and customize it as needed
        let counterWithoutAccessoryForTextView = CharacterCounter(textInput: textViewWithoutAccessoryView, maxCharacterLimit: 10, useAsAccessoryView: false)
        self.view.addSubview(counterWithoutAccessoryForTextView)
        counterWithoutAccessoryForTextView.textColorWithinLimit = UIColor.white
        counterWithoutAccessoryForTextView.textColorForMaxLimit = UIColor.red
        counterWithoutAccessoryForTextView.counterLabel.font = UIFont(name: "HelveticaNeue-Italic", size: 15)
        counterWithoutAccessoryForTextView.doneButton.titleLabel?.font = UIFont(name: "Georgia", size: 10)
        counterWithoutAccessoryForTextView.backgroundColor = UIColor.black
        counterWithoutAccessoryForTextView.accessibilityLabel = "textViewCounter"
        
        self.view.addConstraints([
            NSLayoutConstraint(item: counterWithoutAccessoryForTextView, attribute: .leading, relatedBy: .equal, toItem: textViewWithoutAccessoryView, attribute: .leading, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: counterWithoutAccessoryForTextView, attribute: .trailing, relatedBy: .equal, toItem: textViewWithoutAccessoryView, attribute: .trailing, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: counterWithoutAccessoryForTextView, attribute: .top, relatedBy: .equal, toItem: textViewWithoutAccessoryView, attribute: .bottom, multiplier: 1.0, constant: 5),
            NSLayoutConstraint(item: counterWithoutAccessoryForTextView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 45)
            ])
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

