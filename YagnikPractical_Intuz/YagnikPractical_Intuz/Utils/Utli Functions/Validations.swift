//
//  Validations.swift
//  EventManager
//
//  Created by viral shah on 08/06/17.
//  Copyright © 2017 viral shah. All rights reserved.
//

import UIKit

extension String {
 
    var isTrimmed : String {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed
        }
    }
    
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
        
    var isAlphabatics : Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
    }
    
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    var isEmail: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
        } catch {
            return false
        }
    }
    
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    var isValidPassword: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)$", options: .caseInsensitive)
            //(?=.*[!@#$&*])
            if(regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil){
                
                if self.setMinMaxCount(6, max: 20) {
                    return true
                }
                else {
                    return false
                }
            }else{
                return false
            }
        } catch {
            return false
        }
    }
    
    var isValidPasswordWithSpecialChar: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^(?=.*[0-9])(?=.*[a-zA-Z])([0-9A-Za-z!@#$%^&+=]+)$", options: .caseInsensitive)
//            ("^(?=.*[0-9])(?=.*[a-zA-Z])[0-9A-Za-z!@#$%^&+=]{7,15}")
            if(regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil){
                
                if self.setMinMaxCount(6, max: 20) {
                    return true
                }
                else {
                    return false
                }
            }else{
                return false
            }
        } catch {
            return false
        }
    }
    
    var isValidPasswordLength: Bool {
        do {
            if self.setMinMaxCount(6, max: 20) {
                return true
            }
            else {
                return false
            }
        } catch {
            return false
        }
    }
    
    func setMinMaxCount(_ min: Int, max: Int) -> Bool {
        if self.count < min || self.count > max {
            return false
        }
        else {
            return true
        }
    }
}
