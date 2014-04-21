//
//  AppDelegate.h
//  igpstracestore
//
//  Created by Christopher Hobbs on 4/20/14.
//  Copyright (c) 2014 Toonsy Net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataStack.h"
#import "Trace.h"
#import "LocationUpdater.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) Trace *trace;
@property (strong, nonatomic) LocationUpdater *locationUpdater;

+(AppDelegate *) instance;
@end
