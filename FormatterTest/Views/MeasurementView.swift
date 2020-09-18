//
//  MeasurementView.swift
//  FormatterTest
//
//  Created by Stefan Wieland on 10.09.20.
//  Copyright © 2020 Stefan Wieland. All rights reserved.
//

// https://yannickloriot.com/2016/06/measurements-and-units-ios/

import SwiftUI

struct MeasurementView: View {
    
    let formatter: MeasurementFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 1
        
        let formatter = MeasurementFormatter()
        formatter.numberFormatter = numberFormatter
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .medium
        
        return formatter
    }()
    
    let acceleration = Measurement<UnitAcceleration>(value: 1100000000, unit: .metersPerSecondSquared)
    let frequency = Measurement<UnitFrequency>(value: 3.4, unit: .gigahertz)
    
    var body: some View {
        
        let degrees = Measurement<UnitAngle>(value: 180, unit: .degrees)
        let radians = degrees.converted(to: UnitAngle.sepp)
        
        return VStack {
            Text(formatter.string(from: acceleration))
            Text(formatter.string(from: frequency))
            Text(formatter.string(from: degrees))
            Text(formatter.string(from: radians))
            Text(formatter.string(from: UnitAcceleration.gravity))
            Text(formatter.string(from: UnitEnergy.joules))
        }
    }
}

struct MeasurementView_Previews: PreviewProvider {
    
    static let localizations = Bundle.main.localizations.map(Locale.init).filter { $0.identifier != "base" }
    
    static var previews: some View {
        ForEach(localizations, id: \.identifier) { locale in
            MeasurementView()
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .environment(\.locale, locale)
                .previewDisplayName(Locale.current.localizedString(forIdentifier: locale.identifier))
        }
    }
}

extension UnitAngle {
    
    static let sepp = UnitAngle(symbol: "SP", converter: UnitConverterLinear(coefficient: 2.5))
    
}

final class UnitFlowRate : Dimension {
    
    override static func baseUnit() -> UnitFlowRate {  return metricTonsPerHour }

    static let shortTonsPerHour = UnitFlowRate(symbol: NSLocalizedString("stph", comment: "short tons per hour"), converter: UnitConverterLinear(coefficient: 1))
    
    static let metricTonsPerHour = UnitFlowRate(symbol: NSLocalizedString("mtph", comment: "metric tons per hour"), converter: UnitConverterLinear(coefficient: 2))
}
