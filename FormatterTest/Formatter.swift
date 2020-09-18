//
//  Formatter.swift
//  FormatterTest
//
//  Created by Stefan Wieland on 04.09.20.
//  Copyright © 2020 Stefan Wieland. All rights reserved.
//

import Foundation

struct Formatter {
    
    // MARK: - Date
    
    struct Date {
        
        static let dateShort: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .none
            return formatter
        }()
        
        static let dateTimeLong: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .medium
            return formatter
        }()
        
    }
    
    // MARK: - RelativeDate
    
    struct RelativeDate {
        
        static let named: RelativeDateTimeFormatter = {
            let formatter = RelativeDateTimeFormatter()
            formatter.dateTimeStyle = .named
            return formatter
        }()
        
    }
    
    // MARK: - Person
    
    struct Person {
        
        static let `default`: PersonNameComponentsFormatter = {
            let formatter = PersonNameComponentsFormatter()
            formatter.style = .medium
            return formatter
        }()
        
    }
    
}
