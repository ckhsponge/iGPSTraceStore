//
//  ViewController.m
//  igpstracestore
//
//  Created by Christopher Hobbs on 4/20/14.
//  Copyright (c) 2014 Toonsy Net. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Trace.h"
#import "Location.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)printLocations:(id)sender {
    Trace *trace = [AppDelegate instance].trace;
    for( Location *location in trace.locations) {
        NSLog(@"%@",location);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
