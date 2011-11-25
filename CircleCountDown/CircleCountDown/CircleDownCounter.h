//
//  CircleDownCounter.h
//  CircleCountDown
//
//  Created by Haoxiang Li on 11/25/11.
//  Copyright (c) 2011 DEV. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    CircleDownCounterTypeIntegerDecre = 0, //< Default
    CircleDownCounterTypeOneDecimalDecre,
    CircleDownCounterTypeIntegerIncre,
    CircleDownCounterTypeOneDecimalIncre
} CircleDownCounterType;

#define kDefaultCounterSize CGSizeMake(44,44)

@class CircleCounterView;

@interface CircleDownCounter : NSObject

+ (CircleCounterView *)showCircleDownWithSeconds:(float)seconds onView:(UIView *)view;
+ (CircleCounterView *)showCircleDownWithSeconds:(float)seconds onView:(UIView *)view withSize:(CGSize)size;
+ (CircleCounterView *)showCircleDownWithSeconds:(float)seconds onView:(UIView *)view withSize:(CGSize)size andType:(CircleDownCounterType)type;

//< Utilities
+ (CGRect)frameOfCircleViewOfSize:(CGSize)size inView:(UIView *)view;
+ (CircleCounterView *)circleViewInView:(UIView *)view;

@end
