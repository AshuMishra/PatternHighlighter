//
//  ViewController.swift
//  PatternHighlighter
//
//  Created by Susmita Horrow on 06/03/16.
//  Copyright © 2016 hsusmita.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet var customTextField: UITextField!

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func didChangeText(sender: AnyObject) {
		let finalString = NSMutableAttributedString(attributedString: self.customTextField.attributedText!)
		if finalString.length > 0 {
			finalString.addAttribute(NSForegroundColorAttributeName, value: self.customTextField.textColor!, range: NSMakeRange(0, finalString.length))
			self.customTextField.attributedText = finalString.userHandleHighlightedString()
		}
	}

	func searchName() -> String? {
		// Send call
		return "Ashutosh"
	}
}

extension ViewController: UITextFieldDelegate {
	func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
		let finalString = NSMutableAttributedString(attributedString: textField.attributedText!)
		if string == "@" {
			guard let searchString = self.searchName() else { return true }
			let userhandleString = "@\(searchString)"
			let string = userhandleString as NSString
			let rangeOfText = string.rangeOfString(userhandleString)
			let userhandleAttributedString = NSMutableAttributedString(string: userhandleString)
			userhandleAttributedString.addAttribute(UserHandleAttributeDictonary, value: [NSForegroundColorAttributeName: UIColor.redColor()],
			 range: NSMakeRange(rangeOfText.location, rangeOfText.length))

			finalString.appendAttributedString(userhandleAttributedString.userHandleHighlightedString())
			textField.attributedText = finalString
				return false
			}
		return true
	}
}

extension UITextField {

}