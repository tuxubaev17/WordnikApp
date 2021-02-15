//
//  Helper.swift
//  Lesson-8. MVC P
//
//  Created by Alikhan Tuxubayev on 15.02.2021.
//

import Foundation

extension String {
    func validatePassword() -> Bool {
        if self.count < 8 {
            return false
        }else {
            return true
        }
    }
}
