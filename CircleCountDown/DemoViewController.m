//
//  DemoViewController.m
//  CircleCountDown
//
//  Created by Haoxiang Li on 11/25/11.
//  Copyright (c) 2011 DEV. All rights reserved.
//

#import "DemoViewController.h"
#import "CircleDownCounter.h"

#define kMiddleSize CGSizeMake(88, 88)
#define kLargeSize CGSizeMake(120, 120)

@implementation DemoViewController
@synthesize segControl, containerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.segControl = nil;
    self.containerView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (CGSize)sizeFromSegControl {
    if (self.segControl.selectedSegmentIndex == 0)
    {
        return kDefaultCounterSize;
    }
    else if (self.segControl.selectedSegmentIndex == 1)
    {
        return kMiddleSize;
    }
    else
    {
        return kLargeSize;
    }
}

- (IBAction)buttonIntDecre:(id)sender {
    [CircleDownCounter showCircleDownWithSeconds:10.0f
                                          onView:self.containerView
                                        withSize:[self sizeFromSegControl]
                                         andType:CircleDownCounterTypeIntegerDecre];
}

- (IBAction)buttonIntIncre:(id)sender {
    [CircleDownCounter showCircleDownWithSeconds:10.0f
                                          onView:self.containerView
                                        withSize:[self sizeFromSegControl]
                                         andType:CircleDownCounterTypeIntegerIncre];
}

- (IBAction)buttonDecDecre:(id)sender {
    [CircleDownCounter showCircleDownWithSeconds:10.0f
                                          onView:self.containerView
                                        withSize:[self sizeFromSegControl]
                                         andType:CircleDownCounterTypeOneDecimalDecre];
}

- (IBAction)buttonDecIncre:(id)sender {
    [CircleDownCounter showCircleDownWithSeconds:10.0f
                                          onView:self.containerView
                                        withSize:[self sizeFromSegControl]
                                         andType:CircleDownCounterTypeOneDecimalIncre];
}

@end
