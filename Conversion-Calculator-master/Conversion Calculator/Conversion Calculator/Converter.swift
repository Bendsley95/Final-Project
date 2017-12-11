//
//  Converter.swift
//  Conversion Calculator
//
//  Created by Shannon, Leandre D. (MU-Student) on 11/9/17.
//  Copyright © 2017 Shannon, Leandre D. (MU-Student). All rights reserved.
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
