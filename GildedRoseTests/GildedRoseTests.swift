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
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual("foo", app.items[0].name);
    }
    
    
}
