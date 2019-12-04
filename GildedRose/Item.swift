//
//  Item.swift
//  GildedRose
//
//  Created by Ceren Gazioglu Majoor on 04/12/2019.
//  Copyright © 2019 Lucium. All rights reserved.
//


public class Item {
    public var name: String
    public var sellIn: Int
    public var quality: Int
    
    public init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }
}

extension Item: CustomStringConvertible {
    public var description: String {
        return self.name + ", " + String(self.sellIn) + ", " + String(self.quality);
    }
}

extension Item {
    public func updateQuality(by quantity: Int) {
        self.quality += quantity
        
        guard self.quality >= 0 else {
            self.quality = 0
            return
        }
    }
    
    public func updateSellIn(by quantity: Int) {
        self.sellIn += quantity
    }
}
