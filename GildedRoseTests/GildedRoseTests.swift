//
//  GildedRoseTests.swift
//  GildedRoseTests
//
//  Created by Ceren Gazioglu Majoor on 04/12/2019.
//  Copyright © 2019 Lucium. All rights reserved.
//

import XCTest
@testable import GildedRose

class GildedRoseTests: XCTestCase {
    
    var app: GildedRose!
    
    // MARK: Inventory of Items
    let normalItem = Item(name: "foo", sellIn: 0, quality: 0)
    let normalItem2 = Item(name: "foo", sellIn: 1, quality: 0)
    let normalItem3 = Item(name: "foo", sellIn: 1, quality: 1)
    let normalItem4 = Item(name: "foo", sellIn: -1, quality: 2)
    let normalItem5 = Item(name: "foo", sellIn: 2, quality: 50)
    let agedBrieItem = Item(name: "Aged Brie", sellIn: 2, quality: 0)
    let agedBrieItem2 = Item(name: "Aged Brie", sellIn: 2, quality: 50)
    let legendaryItemSulfuras = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80)
    let legendaryItemSulfuras2 = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80)
    let backstagePassItem = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 14, quality: 21)
    let backstagePassItem2 = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 25)
    let backstagePassItem3 = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 35)
    let backstagePassItem4 = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 47)
    let conjuredItem1 = Item(name: "Conjured Mana Cake", sellIn: 3, quality: 6)
    let conjuredItem2 = Item(name: "Conjured Mana Cake", sellIn: 0, quality:50)
    
    var items: [Item] = []
    
    override func setUp() {
        super.setUp()
        
        items = [normalItem,
                 normalItem2,
                 normalItem3,
                 normalItem4,
                 normalItem5,
                 agedBrieItem,
                 agedBrieItem2,
                 legendaryItemSulfuras,
                 legendaryItemSulfuras2,
                 backstagePassItem,
                 backstagePassItem2,
                 backstagePassItem3,
                 backstagePassItem4,
                 conjuredItem1,
                 conjuredItem2]
        
        app  = GildedRose(items: items)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        XCTAssertTrue(true, "True passes.")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MARK: Initial Values
    func testItem_HasNameValue() {
        XCTAssertNotNil(normalItem.name)
    }
    
    func testItem_HasSellInValue() {
        XCTAssertNotNil(normalItem.sellIn)
    }
    
    func testItem_HasQualityValue() {
        XCTAssertNotNil(normalItem.quality)
    }
    
    func testItem_SetDescription() {
        XCTAssertEqual("foo, 0, 0", normalItem.description)
    }
    
    // MARK: Update Quality - Normal Items
    func testUpdateQuality_ItemNameDoesNotChange() {
        app.updateQuality()
        XCTAssertEqual("foo", app.items[0].name);
    }
    
    func testUpdateQuality_SystemLowersSellInValueByOne() {
        app.updateQuality()
        XCTAssertEqual(app.items[1].sellIn, 0)
    }
    
    func testUpdateQuality_ItemQualityAlwaysPositive() {
        app.updateQuality()
        XCTAssertGreaterThanOrEqual(app.items[0].quality, 0)
    }
    
    func testUpdateQuality_NormalItemQualityDegradesByOne() {
        app.updateQuality()
        XCTAssertEqual(app.items[2].quality, 0)
    }
    
    func testUpdateQuality_QualityDegradesTwiceAsFast_OnceSellByDatePassed() {
        app.updateQuality()
        XCTAssertEqual(app.items[3].quality, 0)
    }
    
    func testUpdateQuality_NormalItemQuality_LessThanOrEqualTo50() {
        app.updateQuality()
        XCTAssertLessThanOrEqual(app.items[4].quality, 50)
    }
    
    // MARK: Update Quality - Aged Brie
    func testUpdateQuality_AgedBrieQualityIncreases() {
        app.updateQuality()
        XCTAssertEqual(app.items[5].quality, 1)
    }
    
    func testUpdateQuality_AgedBrieQuality_DoesNotIncreaseAbove50() {
        app.updateQuality()
        XCTAssertLessThanOrEqual(app.items[6].quality, 50)
    }
    
    // MARK: Update Quality - Legendary Item Sulfuras
    func testUpdateQuality_LegendaryItemSulfurasIsNotSold_SellInValueDoesNotChange() {
        app.updateQuality()
        XCTAssertEqual(app.items[7].sellIn, 0)
    }
    
    func testUpdateQuality_LegendaryItemSulfurasQualityValueIs80AndDoesNotChange() {
        app.updateQuality()
        XCTAssertEqual(app.items[8].quality, 80)
    }
    
    // MARK: Update Quality - Backstage Pass
    func testUpdateQuality_SpecialItemBackstagePasses_QualityIncreases() {
        app.updateQuality()
        XCTAssertEqual(app.items[9].quality, 22)
    }
    
    func testUpdateQuality_SpecialItemBackstagePasses_QualityIncreasesBy2_SellInLessThanOrEqualTo10() {
        app.updateQuality()
        XCTAssertEqual(app.items[10].quality, 27)
    }
    
    func testUpdateQuality_SpecialItemBackstagePasses_QualityIncreasesBy3_SellInLessThanOrEqualTo5() {
        app.updateQuality()
        XCTAssertEqual(app.items[11].quality, 38)
    }
    
    func testUpdateQuality_SpecialItemBackstagePasses_Quality0_AfterConcert() {
        app.updateQuality()
        XCTAssertEqual(app.items[12].quality, 0)
    }
    
    // MARK: Update Quality Conjured Item
    func testUpdateQuality_ConjuredItemQuality_DegradesTwiceAsFastAsNormalItems() {
        app.updateQuality()
        XCTAssertEqual(app.items[13].quality, 4)
    }
    
    func testUpdateQuality_ConjuredItemQuality_NeverAbove50() {
        app.updateQuality()
        XCTAssertLessThanOrEqual(app.items[14].quality, 50)
    }
    
}
