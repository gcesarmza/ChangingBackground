//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"

@interface SecondViewController(){
    AppDelegate* appDelegate;
}
-(void)fadeToGreen;
@end

@implementation SecondViewController

-(void)viewDidLoad{
    [self.view setBackgroundColor:[UIColor clearColor]];
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
}

-(void)viewWillAppear:(BOOL)animated {
    self.backgroundImage.hidden=YES;
}

-(void)viewDidAppear:(BOOL)animated {
    self.backgroundImage.hidden=NO;
    [self performSelector:@selector(fadeToGreen) withObject:nil afterDelay:0.5];
}

-(void)fadeToGreen {
    CATransition* fadeToGreen = [CATransition animation];
    fadeToGreen.duration = 1;
    fadeToGreen.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    fadeToGreen.type = kCATransitionFade;
    
    [self.backgroundImage.layer addAnimation:fadeToGreen forKey:nil];
    self.backgroundImage.image = [appDelegate getGreenImage];
    
    self.navigationController.view.backgroundColor = [UIColor colorWithPatternImage:[appDelegate getGreenImage]];
}

- (IBAction)goBackButtonPressed {
    self.backgroundImage.hidden=YES;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
