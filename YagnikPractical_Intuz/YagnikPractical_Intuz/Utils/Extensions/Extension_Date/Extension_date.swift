//
//  Extension_date.swift
//  uClinic
//
//  Created by Viral Shah on 01/05/18.
//  Copyright © 2018 Viral Shah. All rights reserved.
//

import Foundation

extension String {
    var getDateFromString: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale(identifier: "en_US")
        if let date = dateFormatter.date(from: self){
            return date
        }
        return Date()
        
    }
    
    func getStringToDate(_ format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale(identifier: "en_US")
        if let date = dateFormatter.date(from: self) {
            return date
        }
        return Date()
    }
    
    func changeStringDateFormat(_ inFormat: String, outFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inFormat
        dateFormatter.timeZone = .current
        dateFormatter.locale = Locale(identifier: "en_US")
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = outFormat
            if let strDate = dateFormatter.string(from: date) as String? {
                return strDate
            } else {
                return ""
            }
        } else {
            return ""
        }
    }
    
    func changeStringDateFormatWithSuffixTextST(_ inFormat: String, outFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inFormat
        dateFormatter.timeZone = .current
        dateFormatter.locale = Locale(identifier: "en_US")
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = outFormat
            if let strDate = dateFormatter.string(from: date) as String? {
                let calendar = Calendar.current
                var day  = "\(calendar.component(.day, from: date))"
                switch (day) {
                case "1" , "21" , "31":
                    day.append("st")
                case "2" , "22":
                    day.append("nd")
                case "3" ,"23":
                    day.append("rd")
                default:
                    day.append("th")
                }
                
                return strDate + " " + day
            } else {
                return ""
            }
        } else {
            return ""
        }
        
    }
}

extension Date {
    
    var age: Int {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year!
    }
    // MARK:- APP SPECIFIC FORMATS
    
    func    dateToString(_ format : String, locale: String = "en_US", timeZone: TimeZone = TimeZone.current) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = timeZone
        if !locale.isEmpty {
            dateFormatter.locale = Locale(identifier: "en_US")
        }
        if let date = dateFormatter.string(from: self) as String? {
            return date
        }
        return ""
    }
    
    func app_dateFromString(strDate:String, format:String) -> Date? {
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale(identifier: "en_US")
        if let dtDate = dateFormatter.date(from: strDate){
            return dtDate as Date?
        }
        return nil
    }
    
    // Convert local time to UTC (or GMT)
    func toGlobalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = -TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
    
    // Convert UTC (or GMT) to local time
    func toLocalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
    
    var startOfWeek: Date? {
        var gregorian = Calendar(identifier: .gregorian)
        gregorian.firstWeekday = 2
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 1, to: sunday)
    }
    
    var endOfWeek: Date? {
        var gregorian = Calendar(identifier: .gregorian)
        gregorian.firstWeekday = 2
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 7, to: sunday)
    }
    
    var weekDay: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
    
}
