//
//  MZRoundProgressView.h
//  MZRoundProgressView
//
//  Created by Михаил Заславский on 25.12.15.
//  Copyright © 2015 Mikezs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MZRoundProgressView : UIView

@property (nonatomic) CGFloat progress;

@property (nonatomic) int thickness;

@property (nonatomic) CGFloat animationDuration;

@property (strong, nonatomic) UIColor *lineColor;


- (void) updateProgressViewAnimated;

@end
