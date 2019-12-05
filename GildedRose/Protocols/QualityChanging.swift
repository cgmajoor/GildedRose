//
//  QualityChanging.swift
//  GildedRose
//
//  Created by Ceren Gazioglu Majoor on 05/12/2019.
//  Copyright © 2019 Lucium. All rights reserved.
//

protocol QualityChanging {
    func updateQuality()
    func checkQualityRange(between lowerRange: Int, and upperRange: Int)
}

extension QualityChanging where Self: Item {
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
