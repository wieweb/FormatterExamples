//
//  ListFormatterView.swift
//  FormatterTest
//
//  Created by Stefan Wieland on 10.09.20.
//  Copyright © 2020 Stefan Wieland. All rights reserved.
//

import SwiftUI

struct ListFormatterView: View {
    
    let numberListFormatter: ListFormatter = {
        let number = NumberFormatter()
        number.allowsFloats = false
        
        let formatter = ListFormatter()
        formatter.itemFormatter = number
        

        return formatter
    }()
    
    let operatingSystems = ["macOS", "iOS", "iPadOS", "watchOS", "tvOS"]
    
    var body: some View {
        VStack {
            Text(ListFormatter.localizedString(byJoining: operatingSystems))
            Text(numberListFormatter.string(from: [2.63, 4, 56, 7, 8]) ?? "")
        }
    }
}

struct ListFormatterView_Previews: PreviewProvider {
    
    static let localizations = Bundle.main.localizations.map(Locale.init).filter { $0.identifier != "base" }
    
    static var previews: some View {
        ForEach(localizations, id: \.identifier) { locale in
            ListFormatterView()
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .environment(\.locale, locale)
                .previewDisplayName(Locale.current.localizedString(forIdentifier: locale.identifier))
        }
    }
}
