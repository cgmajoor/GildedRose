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
- I first read the [GildedRoseRequirements.txt](https://github.com/emilybache/GildedRose-Refactoring-Kata/blob/master/GildedRoseRequirements.txt), the [ReadMe.md](https://github.com/emilybache/GildedRose-Refactoring-Kata/blob/master/README.md) on EmilyBache's GitHub.
- Cloned and setup the project in XCode. (Read more about the challenges I faced in the Challenges section.)
- Ran the application and saved the output of 16 days as the Golden Master (since one of the items had a sellIn value of 15, I wanted to see how it acted after the sell by date has passed)
- Fixed the first unit test that was failing.
- Created more unit tests that cover the requirements.
- Checked the code coverage of the unit tests.
- Fixed the legacy code to add the conjured item feature.
- Refactored the tests, to clean it up, I moved the repeating item declarations and initializations to the beginning of the class, and setUp an array to keep all items I am testing. Then I fed the app with this items array so it is ready to use in tests.
- Added a test to check the Conjured Item behavior when the sell by date has passed and that its quality is never negative.
- Started refactoring.
- Extraction of method that is acting on one item from the iteration on all items.
- Simplified  `item.quality = item.quality - item.quality ` into  `item.quality = 0 ` for readibility
-

## Challenges
