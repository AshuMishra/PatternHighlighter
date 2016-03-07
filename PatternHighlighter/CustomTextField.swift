//
//  CustomTextField.swift
//  PatternHighlighter
//
//  Created by Susmita Horrow on 06/03/16.
//  Copyright © 2016 hsusmita.com. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
	override func deleteBackward() {
		if let selectedRange = self.selectedTextRange {
			let cursorPosition = self.offsetFromPosition(self.beginningOfDocument, toPosition: selectedRange.start)
			print(cursorPosition)
			guard let currentText = self.text where currentText.characters.count > 0 else { return }
			var finalString = NSAttributedString(string: "")
			if let userHandleRange = self.attributedText?.rangeOfUserHandleAtIndex(cursorPosition - 1) {
				finalString = (self.attributedText?.attributedSubstringFromRange(NSMakeRange(0, userHandleRange.location)))!
			} else {
				finalString = (self.attributedText?.attributedSubstringFromRange(NSMakeRange(0, cursorPosition - 1)))!
			}
			self.attributedText = NSAttributedString(attributedString: finalString).userHandleHighlightedString()
		}
	}
}

