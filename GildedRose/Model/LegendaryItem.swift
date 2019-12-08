//
//  LegendaryItem.swift
//  GildedRose
//
//  Created by Ceren Gazioglu Majoor on 05/12/2019.
//  Copyright © 2019 Lucium. All rights reserved.
//

public class LegendaryItem: Item {
    static let fixedQuality = 80
}

extension LegendaryItem {

    private func checkQuality(_ quality: Int, is fixedQuality: Int = LegendaryItem.fixedQuality) {
        guard quality == fixedQuality else {
            self.quality = fixedQuality
            return
        }
    }
    
    func getQuality() -> Int {
        self.checkQuality(self.quality)
        return self.quality
    }
    
}
