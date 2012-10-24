//
//  CircleCounterView.h
//  CircleCountDown
//
//  Created by Haoxiang Li on 11/25/11.
//  Copyright (c) 2011 DEV. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CircleCounterView;

@protocol CircleCounterViewDelegate <NSObject>

- (void)counterDownFinished:(CircleCounterView *)circleView;

@end

@interface CircleCounterView : UIView {
    
    //< Different with mTimeInterval, this one decides how long a circle finished. 1 seconds by default
    float mCircleTimeInterval;
    
    UIColor *mNumberColor;      //< Black, By Default
    UIFont *mNumberFont;        //< Courier-Bold 20, By Default

    UIColor *mCircleColor;      //< Black, By Default
    CGFloat mCircleBorderWidth; //< 6 pixels, By Default
    
    float mTimeInSeconds;       //< 20, By Default
    float mTimeInterval;        //< 1,  By Default
    NSString *mTimeFormatString; //< For Example, @"%.0f", @"%.1f"
    
    BOOL mIsRunning;
    int mCircleSegs;

    id<CircleCounterViewDelegate> mDelegate;
    
    BOOL mCircleIncre;          //< Default NO, the circle is drawed incrementally, otherwise decrementally
}

@property (nonatomic) id<CircleCounterViewDelegate> delegate;

@property (nonatomic, assign) BOOL circleIncre;

@property (nonatomic, retain) UIColor *numberColor;
@property (nonatomic, retain) UIFont *numberFont;

@property (nonatomic, retain) UIColor *circleColor;
@property (nonatomic, assign) CGFloat circleBorderWidth;
@property (nonatomic, assign) float circleTimeInterval; 

- (void)startWithSeconds:(float)seconds;
- (void)startWithSeconds:(float)seconds andInterval:(float)interval;
- (void)startWithSeconds:(float)seconds andInterval:(float)interval andTimeFormat:(NSString *)timeFormat;
- (void)stop;

@end
