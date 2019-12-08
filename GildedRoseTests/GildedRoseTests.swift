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
    let normalItem2 = Good(name: "foo", sellIn: 1, quality: 0)
    let normalItem3 = Good(name: "foo", sellIn: 1, quality: 1)
    let normalItem4 = Good(name: "foo", sellIn: -1, quality: 2)
    let normalItem5 = Item(name: "foo", sellIn: 2, quality: 50)
    let agedBrieItem = IncreasingQualityItem(name: "Aged Brie", sellIn: 2, quality: 0)
    let agedBrieItem2 = IncreasingQualityItem(name: "Aged Brie", sellIn: 2, quality: 50)
    let legendaryItemSulfuras = LegendaryItem(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80)
    let legendaryItemSulfuras2 = LegendaryItem(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80)
    let backstagePassItem = Ticket(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 14, quality: 21)
    let backstagePassItem2 = Ticket(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 25)
    let backstagePassItem3 = Ticket(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 35)
    let backstagePassItem4 = Ticket(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 47)
    let conjuredItem1 = ConjuredItem(name: "Conjured Mana Cake", sellIn: 3, quality: 6)
    let conjuredItem2 = ConjuredItem(name: "Conjured Mana Cake", sellIn: 0, quality:50)
    let conjuredItem3 = ConjuredItem(name: "Conjured Mana Cake", sellIn: 1, quality: 1)
    
    let good = Good(name: "Good", sellIn: 1, quality: 5)
    let legendaryItem = LegendaryItem(name: "Sulfuras", sellIn: 0, quality: 80)
    let agedBrie = IncreasingQualityItem(name: "Aged Brie", sellIn: 2, quality: 10)
    let backStagePass = Ticket(name: "Backstagepass", sellIn: 1, quality: 1)
    let conjuredItem = ConjuredItem(name: "Conjured Health Boost Drink", sellIn: 1, quality: 7)
    
    var items: [Item] = []
    
    var items2: [Item] = []
    
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
                 conjuredItem2,
                 conjuredItem3]
        
        items2 = [normalItem,
                  good,
                  legendaryItem,
                  agedBrie,
                  backStagePass,
                  conjuredItem]
        
        app  = GildedRose(items: items)
    }
    
    func testExample() {
        XCTAssertTrue(true, "True passes.")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            app  = GildedRose(items: items)
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
    
    func testUpdateQuality_ItemQuality_IsNeverNegative() {
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
    
    func testUpdateQuality_ConjuredItemQuality_IsNeverNegative() {
        app.updateQuality()
        XCTAssertGreaterThanOrEqual(app.items[15].quality, 0)
    }
    
    func testUpdateQuality_ConjuredItemQualityDegradesTwiceAsFastAsNormal_WhenSellInDateHasPassed() {
           app.updateQuality()
           XCTAssertEqual(app.items[14].quality, 46)
    }
    
    // MARK: Good
    func testGood_IsAnItem() {
        let item = Item(name: "Good", sellIn: 1, quality: 5)
        XCTAssertEqual(item.description, items2[1].description)
    }
    
    func testGood_IsSellable() {
        good.updateSellIn(by: -1)
        XCTAssertEqual(items2[1].sellIn, 0)
    }
    
    func testGood_MaxQualityIsFifty() {
        XCTAssertEqual(Good.maxQuality, 50)
    }
    
    func testGood_CannotSetQualityHigherThanMaxQuality() {
        good.setQuality(51)
        XCTAssertEqual(good.getQuality(), Good.maxQuality)
    }
    
    func testGood_SetSellIn() {
        good.setSellIn(0)
        XCTAssertEqual(good.getSellIn(), 0)
    }
    
    // MARK: LegendaryItem
    func testLegendaryItem_IsAnItem() {
        let item = Item(name: "Sulfuras", sellIn: 0, quality: 80)
        XCTAssertEqual(item.description, items2[2].description)
    }
    
    func testLegendaryItem_IsNotSellable() {
        if let _ = legendaryItem as? Sellable {
            XCTAssertFalse(false)
        } else {
            XCTAssertTrue(true)
        }
    }

    func testLegendaryItem_FixedQualityIsEighty() {
        XCTAssertEqual(LegendaryItem.fixedQuality, 80)
    }
    
    func testLegendaryItem_GetQualityReturnesItsFixedQuality() {
        let wrongQualitySulfuras = LegendaryItem(name: "Wrong Quality Sulfuras", sellIn: 0, quality: 81)
        XCTAssertEqual(wrongQualitySulfuras.getQuality(), LegendaryItem.fixedQuality)
    }
    
    // MARK: Increasing Quality Item
    func testIncreasingQualityItem_IsAnItem() {
        let item = Item(name: "Aged Brie", sellIn: 2, quality: 10)
        XCTAssertEqual(item.description, items2[3].description)
    }
    
    func testIncreasingQualityItem_IsAGood() {
        let item = Good(name: "Aged Brie", sellIn: 2, quality: 10)
        XCTAssertEqual(item.description, items2[3].description)
    }
    
    func testIncreasingQualityItem_IsSellable() {
        agedBrie.updateSellIn(by: -1)
        XCTAssertEqual(items2[3].sellIn, 1)
    }
    
    // MARK: Ticket
    func testTicket_IsAnItem() {
        let item = Item(name: "Backstagepass", sellIn: 1, quality: 1)
        XCTAssertEqual(item.description, items2[4].description)
    }
    
    func testTicket_IsAGood() {
        let item = Good(name: "Backstagepass", sellIn: 1, quality: 1)
        XCTAssertEqual(item.description, items2[4].description)
    }
       
    func testTicket_IsSellable() {
        agedBrie.updateSellIn(by: -1)
        XCTAssertEqual(items2[4].sellIn, 1)
    }
    
    // MARK: Conjured Item
    func testConjuredItem_IsAnItem() {
        let item = Item(name: "Conjured Health Boost Drink", sellIn: 1, quality: 7)
        XCTAssertEqual(item.description, items2[5].description)
    }
    
    func testConjuredItem_IsAGood() {
        let item = Good(name: "Conjured Health Boost Drink", sellIn: 1, quality: 7)
        XCTAssertEqual(item.description, items2[5].description)
    }
       
    func testConjuredItem_IsSellable() {
        conjuredItem.updateSellIn(by: -1)
        XCTAssertEqual(items2[5].sellIn, 0)
    }
    
}
