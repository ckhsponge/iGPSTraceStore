//
//  Location.m
//  igpstracestore
//
//  Created by Christopher Hobbs on 4/20/14.
//  Copyright (c) 2014 Toonsy Net. All rights reserved.
//

#import "Location.h"
#import "Trace.h"


@implementation Location

@dynamic date;
@dynamic latitude;
@dynamic longitude;
@dynamic altitude;
@dynamic trace;


-(NSString *) description {
    return [NSString stringWithFormat:@"%@ %@,%@ %@",self.date, self.latitude, self.longitude, self.altitude];
}
@end
