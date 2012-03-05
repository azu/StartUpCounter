//
//  AppDelegate.m
//  StartUpCounter
//
//  Created by azu on 03/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "CountManager.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;


- (void)dealloc {
    [_window release];
    [_viewController release];
    [super dealloc];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[CountManager sharedManager] countUp];
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
    [[CountManager sharedManager] saveCount];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Life cycle
    // http://www.awaresoft.jp/ios-dev/item/114-ios4vs5-application-lifecycle.html
    // http://cocoadays.blogspot.com/2011/04/ios-task-completion.html
    // http://d.hatena.ne.jp/glass-_-onion/20100630/1277909762
    // sleep,background,startup
    [[CountManager sharedManager] countUp];
    [self.viewController updateOutlets];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // 起動シーケンスに含まれる
}

- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
    [[CountManager sharedManager] saveCount];

}

@end