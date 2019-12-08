# GildedRose
Refactoring Kata in Swift 5

Hello, my friend. Stay awhile and listen.

## About the Quest
In Stormwind City, Trade district, there is a small inn called Gilded Rose which also buys and sells goods.
The innkeeper Allison was looking for a mobile magician to help them with their system in place which updates their inventory.
I accepted the quest of refactoring their legacy code so they can also extend it with new features.
You can read about the specifics of this quest [here](https://github.com/emilybache/GildedRose-Refactoring-Kata/blob/master/GildedRoseRequirements.txt).
And find the original code [here](https://github.com/emilybache/GildedRose-Refactoring-Kata)

## Clone and setup 
- Open Terminal.
- Change the directory to where you want to clone the project to.
- Write  `git clone https://github.com/cgmajoor/GildedRose.git` and **Enter**

## My Approach
### Test Driven Design
As a magician who just lands on an existing project you first need to understand what the other magician did to make it work.
So get familiar with it by testing it.
- I first read the [GildedRoseRequirements.txt](https://github.com/emilybache/GildedRose-Refactoring-Kata/blob/master/GildedRoseRequirements.txt), the [ReadMe.md](https://github.com/emilybache/GildedRose-Refactoring-Kata/blob/master/README.md) on EmilyBache's GitHub.
- Cloned and setup the project in XCode. (Read more about the challenges I faced in the Challenges section.)
- Ran the application multiple times with different arguments.
- Saved the output of 16 days as the Golden Master for the Approval test (since one of the items had a sellIn value of 15, I wanted to see how it acted after the sell by date has passed)
- Fixed the first unit test that was failing.
- Created more unit tests that cover the requirements.
- Checked the code coverage of the unit tests.
- Fixed the legacy code to add the conjured item feature. (And saved the new output as the Golden Master.)
- Refactored the tests, to clean it up, I moved the repeating item declarations and initializations to the beginning of the class, and setUp an array to keep all items I am testing. Then I fed the app with this items array so it is ready to use in tests.
- Added a test to check the Conjured Item behavior when the sell by date has passed and that its quality is never negative.

### The problems with the existing code
The legacy code had 1 big method namely “updateQuality" that took care of all the requirements. 
There was no separation of concerns, this put too much pressure and responsibility on one place in the project.
And the giant nested if else statements made it complex and hard to read and understand.
This also increased the dependencies. If something went wrong in this method, it could have a ripple effect on other items’ updates. 
Also the decisions were based on literals which was ready to go wrong. (If the magician added a space after the name of the item for instance it would totally fail to realize an item)
Checking on items’ names being equal to a hard-coded string and making decision accordingly was dangerous. 
Legacy version just allows anyone to set the properties of Item class however they want. No use of access modifiers other than public. There was no information hiding on properties and the items were not responsible of checking their own properties borders. (ex: min quality of a good or fixed quality of legendary items)
The items were added to the inventory via code, which needs a whole update and build on the system in case a new item was to be added. Lastly there was no architecture, no balance in components. This made it hard to find the precise behavior of an item or to add a new behavior. (For instance the quality of an Aged Brie was increased in more than one places in the updateQuality method of the System.) 

### Refactoring
Following Object Oriented Principles, much could be done about:
- readability
- modularity
- simplicity
- scalability
- extendibility
- DRY: Don’t Repeat Yourself (avoid repetition)
- YAGNI, You Ain’t Gonna Need It (removal of unnecessary code)
- removal of hard coded values and literals
- information hiding, reducing dependencies
- use of swift language power

I made small changes and ran the test after each change.	

Low hanging fruits:
- Take responsibility away from the updateQuality method into smaller classes respectively. 
The GildedRose system updateQuality method should only tell the items to update their quality (if they are capable of doing that). It doesn’t need to tell them how, or it shouldn’t see the details. The logic of how an item updates its quality property should be hidden within the responsible class.
- Separation of item’s capabilities into protocols that could be adopted.
- Extraction of method that updates one item from the iteration on all items
- Simplified  `item.quality = item.quality - item.quality ` into  `item.quality = 0 ` for readibility
- Changed for loop that runs on literals into more clear form using iteration on items array for each item
- Checked each item for its capability before acting on it by optional casting it as a type (see if it is conforming to a protocol for instance, Sellable) If an item’s quality is not changeable, don’t run unnecessary code to update it.
- Removing duplicates (such as checking if the quality is less than 50 in more than one places)
- Keep shared properties as static 

### Challenges
- Setting up the project in an empty project. XCode 11.2.1 seems to have a bug with XCTest in empty project.
- Overriding in Swift 5 can be done by adding @objc in front of the function or protocol. This needed importing of Foundation.
- How much refactoring is necessary? Sometimes using language features to go further with refactoring in order to shorten the code ends up in less readable code. (instead of using a for loop, I could use a map and a closure to update the items)
`
    public func updateQuality() {
        items.map{
            if let qualityChangingItem = $0 as? QualityChanging {
                updateQualityOf(qualityChangingItem)
            }
            if let sellableItem = $0 as? Sellable {
                updateSellInOf(sellableItem)
            }
        }
    }
`
### Future Scenarios & To-Do's
I came up with some scenarios which could give us a clue on how extendible the code base is right now. And what we could do further to comply to changes.
- What if the number of items grew so much that we cannot keep track of it manually? We cannot keep on adding them manually to the items array. We need a persistent data storage. We can separate the source of data from the system. Create a new Inventory class which will be used by the System. Separate the data access object from the used models in the application. Add a translator to turn data fetched from an external JSON file into the right object before feeding them to Inventory. A more complex architecture, but now overkill perhaps.
- What if the inn has a new enchanted product whose quality can increase to 100 if it is enchanted with a specific spell? So we want to change the maxQuality property in a new item? Then we need to declare it as a class property (computed property) so: `class var maxQuality : Int { return 50 }` and override it so: `override class var maxQuality : Int { return 100 }`
- What happens if we had to run weekly updates that decrease quality by 7 instead of daily updates that decrease it by 1? Could we get negative values? No, thanks to our new getters and setters.
