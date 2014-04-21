//
//  Trace.m
//  igpstracestore
//
//  Created by Christopher Hobbs on 4/20/14.
//  Copyright (c) 2014 Toonsy Net. All rights reserved.
//

#import "Trace.h"
#import "Location.h"
#import "CoreDataStack.h"

@implementation Trace

@dynamic name;
@dynamic locations;

+(Trace *) findFirst {
    NSManagedObjectContext *context = [CoreDataStack instance].managedObjectContext;
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Trace" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    [request setFetchLimit:1];
    
    NSError *error;
    NSArray *array = [context executeFetchRequest:request error:&error];
    
    if( error ) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }
    
    return array && array.count > 0 ? array[0] : nil;
}

-(void) addCLLocation:(CLLocation *) clLocation {
    
    NSManagedObjectContext *context = [[CoreDataStack instance] managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Location" inManagedObjectContext:context];
    Location *location = [[Location alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    
    location.date = clLocation.timestamp;
    location.latitude = [NSNumber numberWithDouble:clLocation.coordinate.latitude];
    location.longitude = [NSNumber numberWithDouble:clLocation.coordinate.longitude];
    if (clLocation.verticalAccuracy >= 0.0 ) {
        location.altitude = [NSNumber numberWithDouble:clLocation.altitude];
    }
    //[self addLocationsObject:location];
    location.trace = self;
    
    [[CoreDataStack instance] saveContext];
}

-(NSString *) description {
    return self.name;
}

@end
