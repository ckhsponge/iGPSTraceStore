//
//  LocationUpdater.h
//  descent
//
//  Created by Christopher Hobbs on 1/30/14.
//  Copyright (c) 2014 Toonsy Net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>
//#import "LocationUpdateable.h"

@interface LocationUpdater : NSObject <CLLocationManagerDelegate>  {
}

@property (strong, nonatomic) CLLocation *location;

@property (strong, nonatomic) CLLocationManager *locationManager;
- (void) start;
//- (void) addListener:(id <LocationUpdateable>) updateable;
//- (void) removeListener:(id <LocationUpdateable>) updateable;

@end
