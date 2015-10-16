# UILifeCycleClosure

[![Build Status](https://travis-ci.org/ukitaka/UILifeCycleClosure.svg)](https://travis-ci.org/ukitaka/UILifeCycleClosure)
[![Version](https://img.shields.io/cocoapods/v/UILifeCycleClosure.svg?style=flat)](http://cocoapods.org/pods/UILifeCycleClosure)
[![License](https://img.shields.io/cocoapods/l/UILifeCycleClosure.svg?style=flat)](http://cocoapods.org/pods/UILifeCycleClosure)
[![Platform](https://img.shields.io/cocoapods/p/UILifeCycleClosure.svg?style=flat)](http://cocoapods.org/pods/UILifeCycleClosure)
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift2-compatible-4BC51D.svg?style=flat" alt="Swift 2 compatible" /></a>


## Usage

### afterViewDidLoad / afterAwakeFromNib

IBOutlets are initialized during view loading process and they are not accessible at the point you are trying to reach them.

In `UIViewController`, `afterViewDidLoad` guarantees that block will invoke after view is loaded.
If isViewLoaded is true, invoke a block immediately.

```
@IBOutlet weak var label: UILabel!

func configLabel(text: String) {
    afterViewDidLoad {
        self.label.text = text
    }
}
```

`afterViewDidLoadSafety` is available to perform more safely.

```
guard let _ = try? afterViewDidLoadSafety({ self.label.text = text }) else {
    preconditionFailure()
}
```

Similarly, `afterAwakeFromNib` is available in a UIView.

```
func configLabel(text: String) {
    afterAwakeFromNib {
        self.label.text = text
    }
}
```



### afterViewDidAppear

`afterViewDidLoad` guarantees that block will invoke after `viewDidAppear:`.
For example, if you call `presentViewController` before `viewDidAppear:`, then the warning "Presenting view controllers on detached view controllers is discouraged…" will be displayed in Xcode.


`afterViewDidAppear` can be used as follows 

```
afterViewDidAppear {
	self.presentViewController(vc, animated: true, completion: nil)
}
```


## Requirements

+ iOS8.0+
+ Xcode7.0+

## Installation

UILifeCycleClosure is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "UILifeCycleClosure"
```

## Author

ukitaka, yuki.takahashi.1126@gmail.com

## License

UILifeCycleClosure is available under the MIT license. See the LICENSE file for more info.