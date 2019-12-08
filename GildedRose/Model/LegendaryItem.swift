//
//  LegendaryItem.swift
//  GildedRose
//
//  Created by Ceren Gazioglu Majoor on 05/12/2019.
//  Copyright © 2019 Lucium. All rights reserved.
//

public class LegendaryItem: Item {
    static let minQuality = 0
    static let maxQuality = 80
}

extension LegendaryItem {
    private func checkQualityRange(_ quality: Int, between minQuality:Int = LegendaryItem.minQuality, and maxQuality: Int = LegendaryItem.maxQuality){
        guard quality >= minQuality else {
            self.quality = LegendaryItem.minQuality
            return
        }
        
        guard quality <= maxQuality else {
            self.quality = LegendaryItem.maxQuality
            return
        }
    }
    
    public func getQuality() -> Int {
        self.checkQualityRange(self.quality)
        return self.quality
    }
    
    private func setQuality(_ quality:Int) {
        self.checkQualityRange(quality)
        self.quality = quality
    }
}
