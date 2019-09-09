# CharacterCounter

[![CI Status](https://img.shields.io/travis/javalnanda/CharacterCounter.svg?style=flat)](https://travis-ci.org/javalnanda/CharacterCounter)
[![Version](https://img.shields.io/cocoapods/v/CharacterCounter.svg?style=flat)](https://cocoapods.org/pods/CharacterCounter)
[![License](https://img.shields.io/cocoapods/l/CharacterCounter.svg?style=flat)](https://cocoapods.org/pods/CharacterCounter)
[![Platform](https://img.shields.io/cocoapods/p/CharacterCounter.svg?style=flat)](https://cocoapods.org/pods/CharacterCounter)

## Example

To run the example project, clone the repo, and run the target CharacterCounterExample.

## Requirements

## Installation

CharacterCounter is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CharacterCounter'
```

## Usage

You can use this component as a keyboard accessory view or add as a subview to view whatever suits your requirement.
Refer to the examples in ViewController file in CharacterCounterExample folder.

The component handles the delegate for textfield/textview. If you wish to manage it yourself for updating button states or any other requirements based on text changes, you can simply implement the delegates in your viewcontroller and call `updateCharacterCount()` method of the component to update the counter text.

## Author

Javal Nanda, javalnanda@gmail.com

## License

CharacterCounter is available under the MIT license. See the LICENSE file for more info.
