//
//  TestError.swift
//  ReactiveCocoa
//
//  Created by Almas Sapargali on 1/26/15.
//  Copyright (c) 2015 GitHub. All rights reserved.
//

import Foundation
import ReactiveCocoa

enum TestError: Int {
	case Default = 0
	case Error1 = 1
	case Error2 = 2
}

extension TestError: ErrorType {
	var nsError: NSError {
		return NSError(domain: "org.reactivecocoa.ReactiveCocoa.Tests", code: rawValue, userInfo: nil)
	}
}
