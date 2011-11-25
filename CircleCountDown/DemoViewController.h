//
//  DemoViewController.h
//  CircleCountDown
//
//  Created by Haoxiang Li on 11/25/11.
//  Copyright (c) 2011 DEV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoViewController : UIViewController

@property (nonatomic, retain) IBOutlet UISegmentedControl *segControl;
@property (nonatomic, retain) IBOutlet UIView *containerView;

- (IBAction)buttonIntDecre:(id)sender;
- (IBAction)buttonIntIncre:(id)sender;
- (IBAction)buttonDecDecre:(id)sender;
- (IBAction)buttonDecIncre:(id)sender;

@end
