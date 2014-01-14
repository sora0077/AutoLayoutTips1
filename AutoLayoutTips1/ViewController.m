//
//  ViewController.m
//  AutoLayoutTips1
//
//  Created by 林 達也 on 2014/01/14.
//  Copyright (c) 2014年 林 達也. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    __weak IBOutlet NSLayoutConstraint *_greenWidthConstraint;
    __weak IBOutlet NSLayoutConstraint *_blueHeightConstraint;
    __weak IBOutlet NSLayoutConstraint *_yellowHeightConstratint;
    __weak IBOutlet NSLayoutConstraint *_yellowWidthConstraint;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toggleConstraint:(NSLayoutConstraint *)constraint min:(CGFloat)a andMax:(CGFloat)b
{
    CGFloat current = constraint.constant;
    if ((a + b) / 2 > current) {
        constraint.constant = b;
    } else {
        constraint.constant = a;
    }
}

- (IBAction)greenAction:(id)sender
{
    [self toggleConstraint:_greenWidthConstraint
                       min:70 andMax:400];
    [self toggleConstraint:_yellowWidthConstraint
                       min:70 andMax:400];
    [UIView animateWithDuration:0.2
                     animations:^{
                         [self.view layoutIfNeeded];
                     }];
}

- (IBAction)blueAction:(id)sender
{
    [self toggleConstraint:_blueHeightConstraint
                       min:168 andMax:400];
    [self toggleConstraint:_yellowHeightConstratint
                       min:168 andMax:400];
    [UIView animateWithDuration:0.2
                     animations:^{
                         [self.view layoutIfNeeded];
                     }];
}

- (IBAction)yellowAction:(id)sender
{
    [self toggleConstraint:_greenWidthConstraint
                       min:70 andMax:400];
    [self toggleConstraint:_yellowWidthConstraint
                       min:70 andMax:400];
    [self toggleConstraint:_blueHeightConstraint
                       min:168 andMax:400];
    [self toggleConstraint:_yellowHeightConstratint
                       min:168 andMax:400];
    [UIView animateWithDuration:0.2
                     animations:^{
                         [self.view layoutIfNeeded];
                     }];
}

@end
