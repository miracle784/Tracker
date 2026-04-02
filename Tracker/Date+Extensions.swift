import Foundation

extension Date {
    var trackerWeekday: Weekday {
        let weekdayNumber = Calendar.current.component(.weekday, from: self)
        return Weekday(rawValue: weekdayNumber) ?? .monday
    }
}
