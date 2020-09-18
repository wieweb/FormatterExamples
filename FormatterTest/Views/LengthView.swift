//
//  LengthView.swift
//  FormatterTest
//
//  Created by Stefan Wieland on 10.09.20.
//  Copyright © 2020 Stefan Wieland. All rights reserved.
//

import SwiftUI

struct LengthView: View {
    
    let formatter: LengthFormatter = {
        let number = NumberFormatter()
        number.maximumFractionDigits = 2
        number.minimumFractionDigits = 0
        
        let formatter = LengthFormatter()
        formatter.numberFormatter = number
        formatter.unitStyle = .medium
        
        return formatter
    }()
    
    let massFormatter: MassFormatter = {
        let number = NumberFormatter()
        number.maximumFractionDigits = 2
        number.minimumFractionDigits = 0
        
        let formatter = MassFormatter()
        formatter.numberFormatter = number
        formatter.unitStyle = .medium
        
        return formatter
    }()
    
    var body: some View {
        VStack {
            Text(formatter.string(fromMeters: 1204))
            Text(formatter.string(fromValue: 123, unit: .centimeter))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
            Text(massFormatter.string(fromKilograms: 1200))
            Text(massFormatter.string(fromValue: 123, unit: .gram))
        }
    }
}

struct LengthView_Previews: PreviewProvider {
    
    static let localizations = Bundle.main.localizations.map(Locale.init).filter { $0.identifier != "base" }
    
    static var previews: some View {
        ForEach(localizations, id: \.identifier) { locale in
            LengthView()
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .environment(\.locale, locale)
                .previewDisplayName(Locale.current.localizedString(forIdentifier: locale.identifier))
        }
    }
}
