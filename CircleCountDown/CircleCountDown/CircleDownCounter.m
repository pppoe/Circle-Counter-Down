//
//  CircleDownCounter.m
//  CircleCountDown
//
//  Created by Haoxiang Li on 11/25/11.
//  Copyright (c) 2011 DEV. All rights reserved.
//

#import "CircleDownCounter.h"
#import "CircleCounterView.h"

static CircleDownCounter *sharedDownCounter = nil;

@interface CircleDownCounter () <CircleCounterViewDelegate>

+ (CircleDownCounter *)circleDownCounter;   
+ (void)removeCircleViewFromView:(UIView *)view;

@end

@implementation CircleDownCounter

+ (CircleCounterView *)showCircleDownWithSeconds:(float)seconds onView:(UIView *)view {
    return [self showCircleDownWithSeconds:seconds onView:view 
                                  withSize:kDefaultCounterSize 
                                   andType:CircleDownCounterTypeIntegerDecre];
}

+ (CircleCounterView *)showCircleDownWithSeconds:(float)seconds onView:(UIView *)view withSize:(CGSize)size {
    return [self showCircleDownWithSeconds:seconds onView:view 
                                  withSize:size
                                   andType:CircleDownCounterTypeIntegerDecre];
}

+ (CircleCounterView *)showCircleDownWithSeconds:(float)seconds onView:(UIView *)view withSize:(CGSize)size andType:(CircleDownCounterType)type {
    
    [self removeCircleViewFromView:view];
    
    CircleCounterView *circleView = [[CircleCounterView alloc] initWithFrame:[self frameOfCircleViewOfSize:size 
                                                                                                    inView:view]];
    [view addSubview:circleView];
    
    circleView.delegate = [self circleDownCounter];
    
    switch (type) {
        case CircleDownCounterTypeIntegerDecre:
            [circleView startWithSeconds:seconds];
            break;            
        case CircleDownCounterTypeOneDecimalDecre:
            circleView.numberFont = [UIFont fontWithName:@"Courier-Bold" size:15.0f];
            [circleView startWithSeconds:seconds andInterval:0.1f 
                           andTimeFormat:@"%.1f"];
            break;            
        case CircleDownCounterTypeIntegerIncre:
            circleView.circleIncre = YES;
            [circleView startWithSeconds:seconds];
            break;            
        case CircleDownCounterTypeOneDecimalIncre:
            circleView.circleIncre = YES;
            circleView.numberFont = [UIFont fontWithName:@"Courier-Bold" size:15.0f];
            [circleView startWithSeconds:seconds andInterval:0.1f 
                           andTimeFormat:@"%.1f"];
            break;            
        default:
            break;
    }
    
    return circleView;
}

+ (void)removeCircleViewFromView:(UIView *)view {
    CircleCounterView *circleView = [self circleViewInView:view];
    if (circleView)
    {
        [circleView removeFromSuperview];
    }
}

//< Utilities
+ (CGRect)frameOfCircleViewOfSize:(CGSize)size inView:(UIView *)view {
    return CGRectInset(view.bounds, 
                       (CGRectGetWidth(view.bounds) - size.width)/2.0f, 
                       (CGRectGetHeight(view.bounds) - size.height)/2.0f);
}

+ (CircleCounterView *)circleViewInView:(UIView *)view {
    for (UIView *subView in [view subviews])
    {
        if ([subView isKindOfClass:[CircleCounterView class]])
        {
            return (CircleCounterView *)subView;
        }
    }
    return nil;
}

+ (CircleDownCounter *)circleDownCounter {
    if (!sharedDownCounter)
    {
        sharedDownCounter = [[CircleDownCounter alloc] init];
    }
    return sharedDownCounter;
}

#pragma mark - CircleCounterViewDelegate
- (void)counterDownFinished:(CircleCounterView *)circleView {
    [circleView removeFromSuperview];
}

@end
