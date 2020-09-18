//
//  NumberView.swift
//  FormatterTest
//
//  Created by Stefan Wieland on 10.09.20.
//  Copyright © 2020 Stefan Wieland. All rights reserved.
//

import SwiftUI

struct NumberView: View {
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"
        
//        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 4
        formatter.minimumFractionDigits = 1
        
        return formatter
    }()
    
    var body: some View {
        VStack {
            Text(formatter.string(for: 0.2345)!)
        }
    }
}

struct NumberView_Previews: PreviewProvider {
    
    static let localizations = Bundle.main.localizations.map(Locale.init).filter { $0.identifier != "base" }
    
    static var previews: some View {
        ForEach(localizations, id: \.identifier) { locale in
            NumberView()
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .environment(\.locale, locale)
                .previewDisplayName(Locale.current.localizedString(forIdentifier: locale.identifier))
        }
    }
}
