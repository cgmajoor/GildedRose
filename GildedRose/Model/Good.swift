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
    class var qualityChangeNormal:Int { return -1 }
    class var qualityChangeSellInPassed:Int { return -2 }
    
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
    
    func getQuality() -> Int {
        self.checkQualityRange(self.quality)
        return self.quality
    }
    
    func setQuality(_ quality:Int) {
        self.quality = quality
        self.checkQualityRange(quality)
    }
    
    func getSellIn() -> Int {
        return self.sellIn
    }
    
    func setSellIn(_ value: Int) {
        self.sellIn = value
    }
}

extension Good: QualityChanging {
    func sellInDatePassed() -> Bool {
        return self.sellIn <= 0
    }
    
    func updateQuality() {
        if sellInDatePassed() {
            self.setQuality(self.getQuality() + Good.qualityChangeSellInPassed)
        } else{
            self.setQuality(self.getQuality() + Good.qualityChangeNormal)
        }
    }
}

extension Good: Sellable {
    func updateSellIn(by quantity: Int) {
        self.setSellIn(self.sellIn + quantity)
    }
}


