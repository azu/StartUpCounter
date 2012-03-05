//
//  ViewController.h
//  StartUpCounter
//
//  Created by azu on 03/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (retain, nonatomic) IBOutlet UILabel *countLabel;

- (void)updateOutlets;

@end