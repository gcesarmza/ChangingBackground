//
//  AppDelegate.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"

@interface AppDelegate () {
    UIWindow *window;
    UIImage* blueImage;
    UIImage* greenImage;
}
@end


@implementation AppDelegate

-(UIImage *)getBlueImage {
    if (blueImage == nil){
        blueImage = [UIImage imageNamed:@"blue.png"];
    }
    return blueImage;
}

-(UIImage *)getGreenImage {
    if (greenImage == nil){
        greenImage = [UIImage imageNamed:@"green.png"];
    }
    return greenImage;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
    [window makeKeyAndVisible];
    
    FirstViewController *firstViewController = FirstViewController.new;
    UINavigationController *navigationController = [UINavigationController.alloc initWithRootViewController:firstViewController];
    [navigationController setNavigationBarHidden:YES];
    [navigationController.view setBackgroundColor:[UIColor colorWithPatternImage:[self getBlueImage] ]];

    window.rootViewController = navigationController;
    
    return YES;
}

@end
