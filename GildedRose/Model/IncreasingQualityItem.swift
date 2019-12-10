//
//  IncreasingQualityItem.swift
//  GildedRose
//
//  Created by Ceren Gazioglu Majoor on 05/12/2019.
//  Copyright © 2019 Lucium. All rights reserved.
//

public class IncreasingQualityItem: Good {
    override class var qualityChangeNormal:Int { return super.qualityChangeNormal * (-1) }
    override class var qualityChangeSellInPassed:Int { return super.qualityChangeSellInPassed * (-1) }
}

extension IncreasingQualityItem {
    override func updateQuality() {
        if self.sellInDatePassed() {
            self.setQuality(self.getQuality() + IncreasingQualityItem.qualityChangeSellInPassed)
        } else {
            self.setQuality(self.getQuality() + IncreasingQualityItem.qualityChangeNormal)
        }
    }
}

