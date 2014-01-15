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

- (void)updateConstraintAnimation:(id)sender
{
    [UIView animateWithDuration:0.2
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         UIScrollView *scrollView = self.view.subviews[0];
                         [scrollView scrollRectToVisible:UIEdgeInsetsInsetRect([[sender superview] frame], UIEdgeInsetsMake(-10, -10, -10, -10))
                                                animated:YES];
                     }];
}

- (IBAction)greenAction:(id)sender
{
    [self toggleConstraint:_greenWidthConstraint
                       min:70 andMax:400];

    [self updateConstraintAnimation:sender];
}

- (IBAction)blueAction:(id)sender
{
    [self toggleConstraint:_blueHeightConstraint
                       min:168 andMax:400];
    
    [self updateConstraintAnimation:sender];
}

- (IBAction)yellowAction:(id)sender
{
    [self toggleConstraint:_greenWidthConstraint
                       min:70 andMax:400];
    [self toggleConstraint:_blueHeightConstraint
                       min:168 andMax:400];

    [self updateConstraintAnimation:sender];
}

@end
