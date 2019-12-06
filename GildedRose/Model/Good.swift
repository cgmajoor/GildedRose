//
//  Good.swift
//  GildedRose
//
//  Created by Ceren Gazioglu Majoor on 05/12/2019.
//  Copyright © 2019 Lucium. All rights reserved.
//


public class Good: Item {
    
}

extension Good: QualityChanging {
    func updateQuality() {
        if self.sellIn <= 0 {
            self.setQuality(self.quality - 2)
        } else{
            self.setQuality(self.quality - 1)
        }
        self.checkQualityRange(between: 0, and: 50)
    }
    
    func checkQualityRange(between lowerRange:Int, and upperRange: Int){
           guard self.quality >= 0 else {
               self.setQuality(0)
               return
           }
           
           guard self.quality <= 50 else {
               self.setQuality(50)
               return
           }
       }
}

extension Good: Sellable {
    func updateSellIn(by quantity: Int) {
        self.sellIn += quantity
    }
}
