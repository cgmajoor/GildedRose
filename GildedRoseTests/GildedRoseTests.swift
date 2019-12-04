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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
    
    func testItem_HasNameValue() {
        let item = Item(name: "foo", sellIn: 0, quality: 0)
        XCTAssertNotNil(item.name)
    }
    
    func testItem_HasSellInValue() {
        let item = Item(name: "foo", sellIn: 0, quality: 0)
        XCTAssertNotNil(item.sellIn)
    }
    
    func testItem_HasQualityValue() {
        let item = Item(name: "foo", sellIn: 0, quality: 0)
        XCTAssertNotNil(item.quality)
    }
    
    func testItem_SetDescription() {
        let item = Item(name: "foo", sellIn: 0, quality: 0)
        XCTAssertEqual("foo, 0, 0", item.description)
    }
    
    func testUpdateQuality_ItemNameDoesNotChange() {
        let items = [Item(name: "foo", sellIn: 0, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual("foo", app.items[0].name);
    }
    
    func testUpdateQuality_SystemLowersSellInValueByOne() {
        let items = [Item(name: "foo", sellIn: 1, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].sellIn, 0)
    }
    
    func testUpdateQuality_ItemQualityAlwaysPositive() {
        let items = [Item(name: "foo", sellIn: 0, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertGreaterThanOrEqual(app.items[0].quality, 0)
    }
    
    func testUpdateQuality_NormalItemQualityDegradesByOne() {
        let items = [Item(name: "foo", sellIn: 1, quality: 1)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 0)
    }
    
    func testUpdateQuality_QualityDegradesTwiceAsFast_OnceSellByDatePassed() {
        let items = [Item(name: "foo", sellIn: -1, quality: 2)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 0)
    }
    
    func testUpdateQuality_SpecialItemAgedBrieQualityIncreases() {
        let items = [Item(name: "Aged Brie", sellIn: 2, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 1)
    }
    
    func testUpdateQuality_NormalItemQuality_LessThanOrEqualTo50() {
        let items = [Item(name: "foo", sellIn: 2, quality: 50)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertLessThanOrEqual(app.items[0].quality, 50)
    }
    
    func testUpdateQuality_LegendaryItemSulfurasIsNotSold_SellInValueDoesNotChange() {
        let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].sellIn, 0)
    }
    
    func testUpdateQuality_LegendaryItemSulfurasQualityValueIs80AndDoesNotChange() {
        let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 80)
    }
    
    func testUpdateQuality_SpecialItemAgedBrieQuality_DoesNotIncreaseAbove50() {
        let items = [Item(name: "Aged Brie", sellIn: 2, quality: 50)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertLessThanOrEqual(app.items[0].quality, 50)
    }
    
    func testUpdateQuality_SpecialItemBackstagePasses_QualityIncreases() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 14, quality: 21)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 22)
    }
    
    func testUpdateQuality_SpecialItemBackstagePasses_QualityIncreasesBy2_SellInLessThanOrEqualTo10() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 25)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 27)
    }
    
    func testUpdateQuality_SpecialItemBackstagePasses_QualityIncreasesBy3_SellInLessThanOrEqualTo5() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 35)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 38)
    }
    
    func testUpdateQuality_SpecialItemBackstagePasses_Quality0_AfterConcert() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 47)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 0)
    }
    
    func testUpdateQuality_ConjuredItemQuality_DegradesTwiceAsFastAsNormalItems() {
        let items = [Item(name: "Conjured Mana Cake", sellIn: 3, quality: 6)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 4)
    }
    
    func testUpdateQuality_ConjuredItemQuality_NeverAbove50() {
           let items = [Item(name: "Conjured Mana Cake", sellIn: 0, quality:50)]
           let app = GildedRose(items: items)
           app.updateQuality()
           XCTAssertLessThanOrEqual(app.items[0].quality, 50)
       }
}
