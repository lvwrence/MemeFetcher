//
//  InterfaceController.m
//  MemeFetcher WatchKit Extension
//
//  Created by Lawrence Wu on 2015-04-10.
//  Copyright (c) 2015 Lawrence Wu, Ivor Peles, Jesse Gleave Riemann. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController
@synthesize meme;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

// fetches meme and display it
- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    
    // grab meme data from network (needs to be asynchronous)
    NSData *memeData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"http://img-9gag-ftw.9cache.com/photo/aArMpO9_700b.jpg"]];
    
    // wrap it in uiimage class
    UIImage *memeImage = [UIImage imageWithData: memeData];
    
    // load it on screen
    [meme setImage: memeImage];
    
    [super willActivate];
}

// stop any pending network requests, etc, cleanup
- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    

    
    [super didDeactivate];
}

@end



