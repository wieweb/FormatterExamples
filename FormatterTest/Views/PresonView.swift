//
//  PersonView.swift
//  FormatterTest
//
//  Created by Stefan Wieland on 04.09.20.
//  Copyright © 2020 Stefan Wieland. All rights reserved.
//

import SwiftUI

struct PersonView: View {
    
    let formatter: PersonNameComponentsFormatter = {
        let formatter = PersonNameComponentsFormatter()
        formatter.style = .long
        return formatter
    }()
    
    var person: PersonNameComponents {
        var components = PersonNameComponents()
        components.givenName = "Vorname"
        components.familyName = "Nachname"
        components.middleName = "Middle"
        components.namePrefix = "Dr."
        return components
    }
    
    var body: some View {
        VStack {
            Text(formatter.string(from: person))
            Text(Locale.current.localizedString(forCurrencyCode: "EUR") ?? "")
        }
    }
}

struct PersonView_Previews: PreviewProvider {
    
    static let localizations = Bundle.main.localizations.map(Locale.init).filter { $0.identifier != "base" }
    
    static var previews: some View {
        ForEach(localizations, id: \.identifier) { locale in
            PersonView()
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .environment(\.locale, locale)
                .previewDisplayName(Locale.current.localizedString(forIdentifier: locale.identifier))
        }
    }
}
