//
//  LocationUpdater.m
//  descent
//
//  Created by Christopher Hobbs on 1/30/14.
//  Copyright (c) 2014 Toonsy Net. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>

#import "AppDelegate.h"
#import "LocationUpdater.h"


@interface LocationUpdater() {
    NSMutableArray *_listeners;
}
@end

@implementation LocationUpdater

-(id) init {
    if (self = [super init])
    {
        _listeners = [[NSMutableArray alloc] init];
    }
    return self;
}


-(void) start {
    self.location = nil;
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager startUpdatingLocation];
    self.locationManager.delegate = self;
}

//-(CLLocation *) debugLocation {
//    CLLocation *location;
//    location = [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(36.0+37.15/60.0, -122-22.51/60.0) altitude:6000.0/FEET_PER_METER horizontalAccuracy:1.0 verticalAccuracy:1.0 course:90.0 speed:120.0*METERS_PER_KTS timestamp:[NSDate date]];
//    location = [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(37.0+37.15/60.0, -123-22.51/60.0) altitude:6000.0/FEET_PER_METER horizontalAccuracy:1.0 verticalAccuracy:1.0 course:90.0 speed:120.0*METERS_PER_KTS timestamp:[NSDate date]];
//    location = [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(36.0+37.15/60.0, -123-22.51/60.0) altitude:6000.0/FEET_PER_METER horizontalAccuracy:1.0 verticalAccuracy:1.0 course:90.0 speed:120.0*METERS_PER_KTS timestamp:[NSDate date]];
//    location = [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(37.0+30.81/60.0, -122-30.07/60.0) altitude:3500.0/FEET_PER_METER horizontalAccuracy:1.0 verticalAccuracy:1.0 course:90.0 speed:120.0*METERS_PER_KTS timestamp:[NSDate date]];
//    if (rand() > RAND_MAX/2) {
//        location = [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(37.0+30.81/60.0, -122-30.07/60.0) altitude:3500.0/FEET_PER_METER horizontalAccuracy:55.0/FEET_PER_METER verticalAccuracy:350.0/FEET_PER_METER course:70.0 speed:120.0*METERS_PER_KTS timestamp:[NSDate date]];
//    } else {
//        location = [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(37.0+30.81/60.0, -122-30.07/60.0) altitude:3550.0/FEET_PER_METER horizontalAccuracy:50.0/FEET_PER_METER verticalAccuracy:355.0/FEET_PER_METER course:350.0 speed:120.0*METERS_PER_KTS timestamp:[NSDate date]];
//    }
//    if (rand() > RAND_MAX/2) {
//        location = [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(37.0+10.81/60.0, -122-30.07/60.0) altitude:5500.0/FEET_PER_METER horizontalAccuracy:55.0/FEET_PER_METER verticalAccuracy:350.0/FEET_PER_METER course:15.0 speed:120.0*METERS_PER_KTS timestamp:[NSDate date]];
//    } else {
//        location = [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(37.0+10.81/60.0, -122-30.07/60.0) altitude:5505.0/FEET_PER_METER horizontalAccuracy:50.0/FEET_PER_METER verticalAccuracy:355.0/FEET_PER_METER course:15.0 speed:120.0*METERS_PER_KTS timestamp:[NSDate date]];
//    }
//    return location;
//}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    @synchronized(self) {
        //CLHeading *heading = manager.heading;
        //NSLog(@"Heading: %lf %lf",heading.trueHeading,heading.magneticHeading);
        for(CLLocation *location in locations) {
            self.location = location;
            
            [[AppDelegate instance].trace addCLLocation:location];
            NSLog(@"Location: %@ Altitude: %lf Speed %lf kts",self.location,self.location.altitude,self.location.speed);
        }
    }
    //[self fireUpdate];
}

//-(void) fireUpdate {
//    @synchronized( self ) {
//        for (id <LocationUpdateable> updateable in _listeners ) {
//            [updateable updateLocation:self];
//        }
//    }
//}

//-(void) addListener:(id<LocationUpdateable>)updateable {
//    if( [_listeners containsObject:updateable]) {return;}
//    [_listeners addObject:updateable];
//    NSLog(@"Add Listeners: %lu",(unsigned long)_listeners.count);
//}
//
//-(void) removeListener:(id<LocationUpdateable>)updateable {
//    if( ![_listeners containsObject:updateable]) {return;}
//    [_listeners removeObject:updateable];
//    NSLog(@"Remove Listeners: %lu",(unsigned long)_listeners.count);
//}

@end
