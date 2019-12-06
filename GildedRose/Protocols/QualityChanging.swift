//
//  QualityChanging.swift
//  GildedRose
//
//  Created by Ceren Gazioglu Majoor on 05/12/2019.
//  Copyright © 2019 Lucium. All rights reserved.
//
import Foundation

@objc protocol QualityChanging {
    func updateQuality()
    func checkQualityRange(between lowerRange: Int, and upperRange: Int)
}
