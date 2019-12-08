//
//  Ticket.swift
//  GildedRose
//
//  Created by Ceren Gazioglu Majoor on 05/12/2019.
//  Copyright © 2019 Lucium. All rights reserved.
//

public class Ticket: Good {
    
}

extension Ticket {
    override func updateQuality() {
        if 6...10 ~= self.sellIn {
            self.setQuality(self.getQuality() + 2)
        } else if 1...5 ~= self.sellIn {
            self.setQuality(self.getQuality() + 3)
        } else if sellIn <= 0 {
            self.setQuality(0)
        } else {
            self.setQuality(self.getQuality() + 1)
        }
    }
}
