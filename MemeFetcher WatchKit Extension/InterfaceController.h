//
//  InterfaceController.h
//  MemeFetcher WatchKit Extension
//
//  Created by Lawrence Wu on 2015-04-10.
//  Copyright (c) 2015 Lawrence Wu, Ivor Peles, Jesse Gleave Riemann. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController <NSURLConnectionDelegate>
{
    NSMutableData *_memeData;
    BOOL memeReady;
}
@property (weak, nonatomic) IBOutlet WKInterfaceButton *memeButton;

- (IBAction)memePressed;
- (void) preloadMeme;


@end
