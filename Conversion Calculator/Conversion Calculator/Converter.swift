//
//  Converter.swift
//  Conversion Calculator
//
//  Created by Endsley, Blake M. (MU-Student) on 12/11/17.
//  Copyright © 2017 Endsley, Blake M. (MU-Student). All rights reserved.
//

import Foundation

struct Converter {
    let label: String
    let inputUnit: String
    let outputUnit: String
    
    init(label: String, inputUnit: String, outputUnit: String) {
        self.label = label
        self.inputUnit = inputUnit
        self.outputUnit = outputUnit
    }
}
