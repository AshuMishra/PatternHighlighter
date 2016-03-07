//
//  NSAttributedString+PatternHighlighter.swift
//  PatternHighlighter
//
//  Created by Susmita Horrow on 06/03/16.
//  Copyright © 2016 hsusmita.com. All rights reserved.
//

import Foundation

let UserHandleAttributeDictonary = "User Handle Attributes"

extension NSAttributedString {
	func userHandleHighlightedString() -> NSAttributedString {
		let currentString = NSMutableAttributedString(attributedString: self)
		guard currentString.length > 0 else { return currentString }
		self.enumerateAttribute(UserHandleAttributeDictonary,
			inRange: NSMakeRange(0, self.length), options: .Reverse) { (attributes, range, stop) -> Void in
				if let userHandleAttributes = attributes as? [String: AnyObject] {
					for (key, value) in userHandleAttributes {
						currentString.addAttribute(key, value: value, range: range)
					}
				}
		}
		return currentString
	}

	func rangeOfUserHandleAtIndex(characterIndex: Int) -> NSRange? {
		var effectiveRange = NSRange()
		guard self.length > 0 else { return nil }
		guard let _ = self.attribute(UserHandleAttributeDictonary, atIndex: characterIndex, effectiveRange: &effectiveRange) else { return nil }
		return effectiveRange
	}
}