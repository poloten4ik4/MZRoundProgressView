# MZRoundProgressView
Custom UIView subclass for circular progress view. 

### Installation

Just add "MZRoundProgressView.h" and "MZRoundProgressView.m" to your project.

Then select the view controller you want to add MZRoundProgressView and paste: 
```sh
#import "MZRoundProgressView.h"
```
Add MZRoundProgressView to your view controller. As example in storyboard. And connect it as outlet. 
```sh
@property (weak, nonatomic) IBOutlet MZRoundProgressView *roundView;
```
Set the parameters of the MZRoundProgressView like that: 
```sh
self.roundView.progress = 0.75;
self.roundView.lineColor = [UIColor blackColor];
self.roundView.thickness = 5;
self.roundView.animationDuration = 0.5;
```
When you need to animate the changes call
```sh
[self.roundView updateProgressViewAnimated];
```


