//
//  FirstViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "AppDelegate.h"

@interface FirstViewController () {
    bool isLoading;
    AppDelegate* appDelegate;
}
-(void)fadeToBlue;
@end

@implementation FirstViewController

-(void)viewDidLoad{
    [self.view setBackgroundColor:[UIColor clearColor]];
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    isLoading = YES;
}

-(void)viewDidAppear:(BOOL)animated {
    if(isLoading){
        isLoading = NO; //for the next time
        return;
    }

    //this will be executed when comming back from second controller
    self.backgroundImage.image = [appDelegate getGreenImage];
    self.backgroundImage.hidden = NO;
    [self performSelector:@selector(fadeToBlue) withObject:nil afterDelay:0.5];
}

-(void)fadeToBlue {
    CATransition* fadeToBlue = [CATransition animation];
    fadeToBlue.duration = 1;
    fadeToBlue.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    fadeToBlue.type = kCATransitionFade;
    
    [self.backgroundImage.layer addAnimation:fadeToBlue forKey:nil];
    self.backgroundImage.image =  [appDelegate getBlueImage];
    
    self.navigationController.view.backgroundColor = [UIColor colorWithPatternImage:[appDelegate getBlueImage]];
}

- (IBAction)goForwardButtonPressed {
    self.backgroundImage.hidden = YES;
    SecondViewController *secondViewController = SecondViewController.new;
    [self.navigationController pushViewController:secondViewController animated:YES];
}


@end
