//
//  Good.swift
//  GildedRose
//
//  Created by Ceren Gazioglu Majoor on 05/12/2019.
//  Copyright © 2019 Lucium. All rights reserved.
//


public class Good: Item {
    static let minQuality = 0
    static let maxQuality = 50
    
    private func checkQualityRange(_ quality: Int, between minQuality:Int = Good.minQuality, and maxQuality: Int = Good.maxQuality) {
        guard quality >= minQuality else {
            self.quality = minQuality
            return
        }
        
        guard quality <= maxQuality else {
            self.quality = maxQuality
            return
        }
    }
    
    public func getQuality() -> Int {
        self.checkQualityRange(self.quality)
        return self.quality
    }
    
    public func setQuality(_ quality:Int) {
        self.quality = quality
        self.checkQualityRange(quality)
    }
    
    public func getSellIn() -> Int {
        return self.sellIn
    }
    
    public func setSellIn(_ value: Int) {
        self.sellIn = value
    }
}

extension Good: QualityChanging {
    func updateQuality() {
        if self.sellIn <= 0 {
            self.setQuality(self.getQuality() - 2)
        } else{
            self.setQuality(self.getQuality() - 1)
        }
    }
}

extension Good: Sellable {
    func updateSellIn(by quantity: Int) {
        self.setSellIn(self.sellIn + quantity)
    }
}


