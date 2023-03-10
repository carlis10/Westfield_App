//
//  DateFormatManager.swift
//  MySchedule
//
//  Created by Apps2M on 17/1/23.
//
import UIKit

class DateFormatterManager: NSObject {

    static let millisecondsLength = 13

    static func FormatDate(_date: Double) -> String{

        var formatedDateTime = ""

        let dateFormatter = DateFormatter()

        var dateToFormat: Date = Date(timeIntervalSince1970: _date)

        if String(Int(_date)).count == millisecondsLength{
           dateToFormat = Date(timeIntervalSince1970: _date / 1000)
        } else if String(Int(_date)).count > millisecondsLength{
            dateToFormat = Date(timeIntervalSince1970: _date / 1000000)
        }

        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"

        formatedDateTime = dateFormatter.string(from: dateToFormat)


        return formatedDateTime
    }

    static func ExtractTimeFormDate(_dateTime: String) -> String{

        return String(_dateTime[_dateTime.index(_dateTime.startIndex, offsetBy: 11)..<_dateTime.index(_dateTime.startIndex, offsetBy: 16)])
    }

    static func ExtractDateFormDate(_dateTime: String) -> String{


        return String(_dateTime[_dateTime.index(_dateTime.startIndex, offsetBy: 0)..<_dateTime.index(_dateTime.startIndex, offsetBy: 10)])
    }

    static func GetDateInDateFormat(_date: Double) -> Date{

        let dateFormatter = DateFormatter()

        var dateToFormat: Date = Date(timeIntervalSince1970: _date)

        if String(Int(_date)).count == millisecondsLength{
           dateToFormat = Date(timeIntervalSince1970: _date / 1000)
        } else if String(Int(_date)).count > millisecondsLength{
            dateToFormat = Date(timeIntervalSince1970: _date / 1000000)
        }

        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"

        return dateToFormat
    }
}
