# MLBootstrap

[![Platforms](https://img.shields.io/cocoapods/p/MLBootstrap.svg)](https://cocoapods.org/pods/MLBootstrap)
[![License](https://img.shields.io/github/license/micheltlutz/MLBootstrap)](https://raw.githubusercontent.com/micheltlutz/MLBootstrap/develop/LICENSE)

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

[![codebeat badge](https://codebeat.co/badges/c7ebffe7-0feb-44f0-8c4f-b7d0ce18ef0e)](https://codebeat.co/projects/github-com-micheltlutz-mlbootstrap-develop)

[![codecov](https://codecov.io/gh/micheltlutz/MLBootstrap/branch/develop/graph/badge.svg)](https://codecov.io/gh/micheltlutz/MLBootstrap)

[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)

Bootstrap for swift apps

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- iOS 11.0+
- Xcode 11+

## Installation

### Dependency Managers

<details>
  <summary><strong>Carthage</strong></summary>

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate MLBootstrap into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "micheltlutz/MLBootstrap" ~> 1.8.0
```

In Terminal using:

```bash
carthage update -- platform ios
```

### On Xcode

Build Phases >. Run Script

using this path: ``` $(SRCROOT)/Carthage/Build/iOS/MLBootstrap.framework ```

Like this:

<image Build Phases screen>

</details>

<details>
  <summary><strong>Swift Package Manager</strong></summary>

To use MLBootstrap as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift
// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "HelloMLBootstrap",
    dependencies: [
        .package(url: "https://github.com/micheltlutz/MLBootstrap.git", .upToNextMajor(from: "1.8.0"))
    ],
    targets: [
        .target(name: "HelloMLBootstrap", dependencies: ["MLBootstrap"])
    ]
)
```
</details>

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate MLBootstrap into your project manually.

<details>
  <summary><strong>Git Submodules</strong></summary><p>

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add MLBootstrap as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/micheltlutz/MLBootstrap.git
$ git submodule update --init --recursive
```

- Open the new `MLBootstrap` folder, and drag the `MLBootstrap.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `MLBootstrap.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `MLBootstrap.xcodeproj` folders each with two different versions of the `MLBootstrap.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from.

- Select the `MLBootstrap.framework`.

- And that's it!

> The `MLBootstrap.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

</p></details>

<details>
  <summary><strong>Embedded Binaries</strong></summary><p>

- Download the latest release from https://github.com/micheltlutz/MLBootstrap/releases
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- Add the downloaded `MLBootstrap.framework`.
- And that's it!

</p></details>

## Usage

### MLLabel


```swift
//Default
MLLabel(text: String, fontSize: Int = 18)

// With NSMutableAttributedString
MLLabel(textLabel: NSMutableAttributedString,
		 color: String? = MLColorPallet.darkGrey.hex,
		 size: Int? = 14)
		 
// With NSMutableAttributedString
MLLabel(textLabel: NSMutableAttributedString,
		 color: String? = MLColorPallet.darkGrey.hex,
		 size: Int? = 14)
		 
// With NSAttributedString
MLLabel(textLabel: NSAttributedString,
		 color: String? = MLColorPallet.darkGrey.hex,
		 size: Int? = 14)
		 
// Paragraph with lineHeigt
mllabel.paragraphStyleWith(attributedString: NSMutableAttributedString, maximunLineHeight: CGFloat)

// Typing Animate
let mllabel = MLLabel(text: "", fontSize: 18)
mllabel.typingAnimate(text: "Hello, typeing message label", timer: 0.15) {
```

### MLButton

```swift
let mlButton = MLButton(text: "Send")
```

### MLSimpleButton

```swift
let mlSimpleButton = MLSimpleButton(text: "Forgot password?")
```

### MLViewConfiguration - ViewConfiguration Helper
```swift

final class MyViewController: UIViewController {
	override viewDidLoad() {
		super.viewDidLoad()
		
		setupViewConfiguration()
	}

}

extension MyViewController: MLViewConfiguration {
	setupConstraints() {
	let defaultWidth = MLSizes.screenWidth() * 0.8
        NSLayoutConstraint.activate([
            fieldName.topAnchor.constraint(equalTo: view.topAnchor, constant: MLSizes.size(multiple: 3)),
            fieldName.widthAnchor.constraint(equalToConstant: defaultWidth),
            fieldName.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            )]
	}
	
	buildViewHierarchy(){
       view.addSubview(fieldName)
	}
	
	func configureViews() {
        view.backgroundColor = .white
    }
}
```

### MLDatePickerField

```swift

 private let fieldBirth: MLDatePickerField = {
        let fieldBirth = MLDatePickerField(placeHolder: "Your Brithday")
        fieldBirth.backgroundColor = .white
        fieldBirth.textColor = MLColorPallet.darkGrey.color
        fieldBirth.layer.borderWidth = 1.0
        fieldBirth.layer.borderColor = MLColorPallet.orange.cgColor
        return fieldBirth
    }()

```

### MLPickerField

```swift
                   
 private let genrePicker: MLPickerField = {
			let options = [(key: "female", value: "Female"), 
							  (key: "male", value: "Male")]

        let genrePicker = MLPickerField(placeHolder: i18n.RegisterFlow.genre.text, options: options)
        genrePicker.backgroundColor = .white
        genrePicker.textColor = MLColorPallet.darkGrey.color
        genrePicker.layer.borderWidth = 1.0
        genrePicker.layer.borderColor = MLColorPallet.orange.cgColor
        return genrePicker
    }()

```

### MLQuestionCheck

### You need two image files with named in your Assets 

- questionUnchecked
- questionChecked

```swift
import MLQuestionCheck

let question1 = MLQuestionCheck(question: "You are ok?")
question1.didChangeState = { checked in
    print("question1 checked? \(checked)")
}

```

### You can Change the image name 
```swift
question1.uncheckedImageName = "new image name"
question1.checkedImageName = "new image name"
question1.setupCheck() // to change configuration buttons

```
### Or Custom Font width and Runtime Change Text

```swift
let questionCheckCustom = MLQuestionCheck(question: "I'm iOS Developer?")
questionCheckCustom.widthQuestion = UIScreen.main.bounds.width
questionCheckCustom.font = UIFont.boldSystemFont(ofSize: 17)
questionCheckCustom.fontChecked = UIFont.boldSystemFont(ofSize: 20)
questionCheckCustom.didChangeState = { isChecked in
	print("questionCheck.isChecked: \(isChecked)")
}

Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (_) in
	self.questionCheckCustom.question = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam."
}
```

### String Utils

* dd/MM/YYYY to YYYY-MM-dd and YYYY-MM-dd to dd/MM/YYYY

```swift

//Params separator: Character = "/", newSeparator: Character = "-"
public var dateFormmater = "13/01/1988".dmyToymd() // Output: "1988-01-13"

//Params separator: Character = "-", newSeparator: Character = "/")
public var dateDbFormmater = "1988-01-13".ymdTodmy() // Output: "13/01/1988"


```


## Contributing

Issues and pull requests are welcome!

## Author

Michel Lutz [@michel_lutz](https://twitter.com/michel_lutz)

## License

MLBootstrap is released under the MIT license. See [LICENSE](https://github.com/micheltlutz/MLBootstrap/blob/master/LICENSE) for details.
