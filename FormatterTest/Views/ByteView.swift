//
//  ByteView.swift
//  FormatterTest
//
//  Created by Stefan Wieland on 04.09.20.
//  Copyright © 2020 Stefan Wieland. All rights reserved.
//

import SwiftUI

struct ByteView: View {
    
    let formatter: ByteCountFormatter = {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = [.useGB]
        return formatter
    }()
    
    let measurement = Measurement<UnitInformationStorage>(value: 12003, unit: .mebibits)
    
    var body: some View {
        VStack {
            Text(formatter.string(fromByteCount: 10240000000))
            Text(formatter.string(from: measurement))
        }
    }
}

struct ByteView_Previews: PreviewProvider {
    
    static let localizations = Bundle.main.localizations.map(Locale.init).filter { $0.identifier != "base" }
    
    static var previews: some View {
        ForEach(localizations, id: \.identifier) { locale in
            ByteView()
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .environment(\.locale, locale)
                .previewDisplayName(Locale.current.localizedString(forIdentifier: locale.identifier))
        }
    }
}
