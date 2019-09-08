//
//  CharacterCounter.swift
//  CharacterCounter
//
//  Created by Javal Nanda on 08/09/19.
//  Copyright © 2019 Javal Nanda. All rights reserved.
//

import Foundation
import UIKit

open class CharacterCounter: UIView {
    let textInput: UITextInput
    var textField: UITextField?
    var textView: UITextView?
    let maxCharacterLimit: Int
    let useAsAccessoryView: Bool
    public var textColorWithinLimit: UIColor = .white
    public var textColorForMaxLimit: UIColor = .red

    public init(textInput: UITextInput, maxCharacterLimit: Int, useAsAccessoryView: Bool = true) {
        self.textInput = textInput
        self.maxCharacterLimit = maxCharacterLimit
        self.useAsAccessoryView = useAsAccessoryView
        super.init(frame: .zero)
        configureUI()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public let counterLabel: UILabel = {
        let counterLabel = UILabel()
        counterLabel.text = ""
        counterLabel.textColor = .white
        counterLabel.accessibilityLabel = "counterLabel"
        return counterLabel

    }()

    public let doneButton: UIButton! = {
        let doneButton = UIButton(type: .custom)
        doneButton.setTitleColor(.white, for: .normal)
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.white, for: .disabled)
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        doneButton.showsTouchWhenHighlighted = true
        doneButton.isEnabled = true
        doneButton.accessibilityLabel = "accessoryViewDoneButton"
        doneButton.isAccessibilityElement = true
        return doneButton
    }()

    func configureUI() {
        self.frame = CGRect(x: 0, y: 0, width: self.superview?.frame.width ?? 0, height: 45)
        self.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .lightGray
        alpha = 0.9
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        doneButton.translatesAutoresizingMaskIntoConstraints = false

        addSubview(counterLabel)
        NSLayoutConstraint.activate([
            counterLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            counterLabel.centerYAnchor.constraint(equalTo: centerYAnchor)])

        if useAsAccessoryView {
            addSubview(doneButton)
            NSLayoutConstraint.activate([
                doneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                doneButton.centerYAnchor.constraint(equalTo: centerYAnchor)])
        }

        setInputDelegate()
    }

    private func setInputDelegate() {
        if let textField = textInput as? UITextField {
            self.textField = textField
            textField.delegate = self
            textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)

        } else if let textView = textInput as? UITextView {
            self.textView = textView
            self.textView?.delegate = self
        }
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        updateCharacterCount()
    }

    public func updateCharacterCount() {
        self.isHidden = false
        let currentCount = getCurrentCharacterCount()
        counterLabel.text = "\(currentCount)/\(maxCharacterLimit)"
        counterLabel.textColor = currentCount == maxCharacterLimit ? textColorForMaxLimit : textColorWithinLimit
    }

    private func getCurrentCharacterCount() -> Int {
        if let textField = textInput as? UITextField {
            return textField.text?.count ?? 0
        } else if let textView = textInput as? UITextView {
            return textView.text.count
        }
        return 0
    }

    @objc private func doneButtonTapped() {
        textField?.endEditing(true)
        textView?.endEditing(true)
    }

    private func hideIfRequired() {
        if !useAsAccessoryView {
            self.isHidden = true
        }
    }
}

extension CharacterCounter: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        updateCharacterCount()
    }

    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return (textField.text?.count ?? 0) + (string.count - range.length) <= maxCharacterLimit
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        hideIfRequired()
    }
}

extension CharacterCounter: UITextViewDelegate {
    public func textViewDidBeginEditing(_ textView: UITextView) {
        updateCharacterCount()
    }

    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return textView.text.count + (text.count - range.length) <= maxCharacterLimit
    }

    public func textViewDidChange(_ textView: UITextView) {
        updateCharacterCount()
    }

    public func textViewDidEndEditing(_ textView: UITextView) {
        hideIfRequired()
    }
}
