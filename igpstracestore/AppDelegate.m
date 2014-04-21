//
//  AppDelegate.m
//  igpstracestore
//
//  Created by Christopher Hobbs on 4/20/14.
//  Copyright (c) 2014 Toonsy Net. All rights reserved.
//

#import "AppDelegate.h"
#import "Trace.h"

@implementation AppDelegate

+(AppDelegate *) instance {
	return (AppDelegate *) [[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    self.trace = [Trace findFirst];
    if (!self.trace) {
        NSManagedObjectContext *context = [[CoreDataStack instance] managedObjectContext];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Trace" inManagedObjectContext:context];
        self.trace = [[Trace alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
        self.trace.name = @"My only trace";
        [[CoreDataStack instance] saveContext];
    }
    
    self.locationUpdater = [[LocationUpdater alloc] init];
    [self.locationUpdater start];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
