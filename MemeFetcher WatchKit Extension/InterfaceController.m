//
//  InterfaceController.m
//  MemeFetcher WatchKit Extension
//
//  Created by Lawrence Wu on 2015-04-10.
//  Copyright (c) 2015 Lawrence Wu, Ivor Peles, Jesse Gleave Riemann. All rights reserved.
//
/*
TODO
-Infinite loading
-Asynchronous 
-Set up server
-Preload images
- Error if no internet.

*/

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController
@synthesize memeButton;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
}

- (IBAction)memePressed {
    [self displayMeme];
    memeReady = false;
    [self preloadMeme];
}

// display meme if ready, else display loading indicator.
- (void) displayMeme {
    if (memeReady){
        UIImage *memeImage = [UIImage imageWithData: _memeData];
        [memeButton setBackgroundImage:memeImage];
    } else {
        NSLog(@"loading...");
    }
}

- (void) preloadMeme {
    //initialize request obj
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://52.5.46.132/meme"]];
    
    //create url connection and send request
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)startMeme {
    UIImage *messyJesse = [UIImage imageNamed: @"waifu.jpg"];
    [memeButton setBackgroundImage:messyJesse];
}


// fetches meme and display it
- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    memeReady = false;
    [self startMeme];
    [self preloadMeme];
    [super willActivate];
}

// stop any pending network requests, etc, cleanup
- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

#pragma mark NSURL Connection Delegate Methods

-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    _memeData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_memeData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    memeReady = true;
    NSLog(@"next meme ready");
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}


@end



