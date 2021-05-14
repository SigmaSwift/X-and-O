//
//  Model.swift
//  xANDnil
//
//  Created by x.sargsyan on 1/31/20.
//  Copyright © 2020 SwiftAcademy. All rights reserved.
//

import Foundation

struct WinCombination {
    func combinations() -> Set<Set<Int>> {
        let winCombination1: Set = [0, 1, 2]
        let winCombination2: Set = [3, 4, 5]
        let winCombination3: Set = [6, 7, 8]
        let winCombination4: Set = [0, 3, 6]
        let winCombination5: Set = [1, 4, 7]
        let winCombination6: Set = [2, 5, 8]
        let winCombination7: Set = [0, 4, 8]
        let winCombination8: Set = [2, 4, 6]

        return [
            winCombination1,
            winCombination2,
            winCombination3,
            winCombination4,
            winCombination5,
            winCombination6,
            winCombination7,
            winCombination8,
        ]
    }
}

