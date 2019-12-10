//
//  Ticket.swift
//  GildedRose
//
//  Created by Ceren Gazioglu Majoor on 05/12/2019.
//  Copyright © 2019 Lucium. All rights reserved.
//

public class Ticket: Good {
    override class var qualityChangeNormal:Int { return 1 }
    class var qualityChangeMore:Int { return 2 }
    class var qualityChangeMost:Int { return 3 }
}

extension Ticket {
    override func updateQuality() {
        if 6...10 ~= self.sellIn {
            self.setQuality(self.getQuality() + Ticket.qualityChangeMore)
        } else if 1...5 ~= self.sellIn {
            self.setQuality(self.getQuality() + Ticket.qualityChangeMost)
        } else if self.sellInDatePassed() {
            self.setQuality(0)
        } else {
            self.setQuality(self.getQuality() + Ticket.qualityChangeNormal)
        }
    }
}
