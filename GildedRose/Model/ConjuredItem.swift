//
//  ConjuredItem.swift
//  GildedRose
//
//  Created by Ceren Gazioglu Majoor on 05/12/2019.
//  Copyright © 2019 Lucium. All rights reserved.
//

public class ConjuredItem: Good {
    
}

extension ConjuredItem {
    override func updateQuality() {
        if self.sellIn <= 0 {
            self.setQuality(self.getQuality() - 4)
        } else{
            self.setQuality(self.getQuality() - 2)
        }
    }
}

