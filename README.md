# CharacterCounter

[![CI Status](https://img.shields.io/travis/javalnanda/CharacterCounter.svg?style=flat)](https://travis-ci.org/javalnanda/CharacterCounter)
[![Version](https://img.shields.io/cocoapods/v/CharacterCounter.svg?style=flat)](https://cocoapods.org/pods/CharacterCounter)
[![License](https://img.shields.io/cocoapods/l/CharacterCounter.svg?style=flat)](https://cocoapods.org/pods/CharacterCounter)
[![Platform](https://img.shields.io/cocoapods/p/CharacterCounter.svg?style=flat)](https://cocoapods.org/pods/CharacterCounter)

## Example

To run the example project, clone the repo, and run the target CharacterCounterExample.

## Requirements

## Installation

CharacterCounter is available through [CocoaPods](https://cocoapods.org) and [Carthage](https://github.com/Carthage/Carthage). 

### CocoaPods

1. Add a pod entry for CharacterCounter to your Podfile `pod 'CharacterCounter', '~> 1.0'`
2. Install the pod(s) by running `pod install`.
3. Include CharacterCounter wherever you need it with `#import CharacterCounter"`.

### Carthage

1. Add CharacterCounter to your Cartfile. e.g., `github "javalnanda/CharacterCounter" ~> 1.0`
2. Run `carthage update`
3. Follow the rest of the [standard Carthage installation instructions](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application) to add CharacterCounter to your project.

## Usage

You can use this component as a keyboard accessory view or add as a subview to view whatever suits your requirement.
Refer to the examples in ViewController file in CharacterCounterExample folder.

The component handles the delegate for textfield/textview. If you wish to manage it yourself for updating button states or any other requirements based on text changes, you can simply implement the delegates in your viewcontroller and call `updateCharacterCount()` method of the component to update the counter text.

## Author

Javal Nanda, javalnanda@gmail.com

## License

CharacterCounter is available under the MIT license. See the LICENSE file for more info.
