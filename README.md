# ASGradientCircularProgress
This is a simple gradient circular progress view.

## Requirements
Xcode 11 and Swift 4+

## Installation
ASPageControlView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ASGradientCircularProgress'
```
![alt-text](https://github.com/arijits95/ASGradientCircularProgress/blob/master/Resources/ASGradientCircularProgressDemoVi.gif)

A simple and easy to use circular gradient progress view which allows all the necessary customizations.

## Usage
Drag a view onto the storyboard and set it class to ASGradientCircularProgress.You can customize the appearance of the circular gradient progress as shown below.

![alt-text](https://github.com/arijits95/ASGradientCircularProgress/blob/master/Resources/Gradient_Progress_1.jpg)

```swift
let gradientCircularProgressOne = ASGradientCircularProgress(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
gradientCircularProgressOne.trackWidth = 10.0
gradientCircularProgressOne.trackColor = UIColor.black.withAlphaComponent(0.1)
gradientCircularProgressOne.progressLineWidth = 10.0
gradientCircularProgressOne.gradientColors = [UIColor.red.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor]
gradientCircularProgressOne.gradientLocations = [0.3, 0.5, 0.8]
gradientCircularProgressOne.startAngle = 0.0
gradientCircularProgressOne.endAngle = CGFloat.pi * 2

gradientCircularProgressOne.setProgressWithAnimation(to: 90)
```

![alt-text](https://github.com/arijits95/ASGradientCircularProgress/blob/master/Resources/Gradient_Progress_2.jpg)

```swift
let gradientCircularProgressTwo = ASGradientCircularProgress(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
gradientCircularProgressTwo.trackWidth = 5.0
gradientCircularProgressTwo.trackColor = UIColor.black.withAlphaComponent(0.1)
gradientCircularProgressTwo.progressLineWidth = 20.0
gradientCircularProgressTwo.gradientColors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
gradientCircularProgressTwo.gradientLocations = [0.3, 0.5]
gradientCircularProgressTwo.startAngle = CGFloat.pi
gradientCircularProgressTwo.endAngle = CGFloat.pi * 3

gradientCircularProgressTwo.setProgressWithAnimation(to: 70)
```

![alt-text](https://github.com/arijits95/ASGradientCircularProgress/blob/master/Resources/Gradient_Progress_3.jpg)

```swift
let gradientCircularProgressThree = ASGradientCircularProgress(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
gradientCircularProgressThree.trackWidth = 30.0
gradientCircularProgressThree.trackColor = UIColor.black.withAlphaComponent(0.1)
gradientCircularProgressThree.progressLineWidth = 30.0
gradientCircularProgressThree.gradientColors = [UIColor.blue.withAlphaComponent(0.5).cgColor, UIColor.blue.cgColor]
gradientCircularProgressThree.gradientLocations = [0.7, 0.9]
gradientCircularProgressThree.gradientStartPoint = CGPoint(x: 0.5, y: 0.5)
gradientCircularProgressThree.gradientEndPoint = CGPoint(x: 1, y: 1)
gradientCircularProgressThree.gradientType = .radial
gradientCircularProgressThree.startAngle = CGFloat.pi + CGFloat.pi / 2
gradientCircularProgressThree.endAngle = CGFloat.pi * 3 + CGFloat.pi / 2
```
You can set both the progress and the center progress percentage label, and use it as a download progress.
```swift
self.gradientCircularProgressThree.setProgress(to: 75)
self.gradientCircularProgressThree.setProgressText(to: "75")
```

## Author
arijits95, arijits95@gmail.com

## License
ASGradientCircularProgress is available under the MIT license. See the LICENSE file for more info.
