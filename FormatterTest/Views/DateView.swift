//
//  DateView.swift
//  FormatterTest
//
//  Created by Stefan Wieland on 04.09.20.
//  Copyright © 2020 Stefan Wieland. All rights reserved.
//

// https://nshipster.com/formatter/

import SwiftUI

struct DateView: View {
    
    private let today = Date()
    private let yesterday = Date().addingTimeInterval(-1 * 24 * 60 * 60)
    private let tomorrow = Date().addingTimeInterval(3 * 24 * 60 * 60)
    
    private let components: DateComponents = {
        var components = DateComponents()
//        components.year = 2020
        components.month = 12
        components.day = 1
        components.hour = 2
        components.minute = 12
        return components
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()
    
    let relativeFormatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
//        formatter.dateTimeStyle = .named
                formatter.dateTimeStyle = .numeric
//                formatter.unitsStyle = .spellOut
        return formatter
    }()
    
    let componentsFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .brief
        formatter.includesApproximationPhrase = true
        formatter.includesTimeRemainingPhrase = true
        formatter.maximumUnitCount = 2
        formatter.allowedUnits = [.day, .hour, .minute]
        return formatter
    }()
    
    let intervalFormatter: DateIntervalFormatter = {
        let formatter = DateIntervalFormatter()
//        formatter.dateStyle = .short
//        formatter.timeStyle = .short
        formatter.dateTemplate = "MMMd"
        return formatter
    }()
    
    var body: some View {
        VStack {
            Text("hello")
            Text(dateFormatter.string(from: today))
            Text(relativeFormatter.string(for: tomorrow)!)
            Text(componentsFormatter.string(for: components)!)
            Text(intervalFormatter.string(from: today, to: tomorrow))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let localizations = Bundle.main.localizations.map(Locale.init).filter { $0.identifier != "base" }
    
    static var previews: some View {
        ForEach(localizations, id: \.identifier) { locale in
            DateView()
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .environment(\.locale, locale)
                .previewDisplayName(Locale.current.localizedString(forIdentifier: locale.identifier))
        }
    }
}
