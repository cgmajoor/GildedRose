//
//  IncreasingQualityItem.swift
//  GildedRose
//
//  Created by Ceren Gazioglu Majoor on 05/12/2019.
//  Copyright © 2019 Lucium. All rights reserved.
//

public class IncreasingQualityItem: Good {
    
}

extension IncreasingQualityItem {
    override func updateQuality() {
        if self.sellIn <= 0 {
            self.setQuality(self.getQuality() + 2)
        } else {
            self.setQuality(self.getQuality() + 1)
        }
    }
}

