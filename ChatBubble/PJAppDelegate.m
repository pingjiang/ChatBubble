//
//  PJAppDelegate.m
//  ChatBubble
//
//  Created by 平江 on 14-9-9.
//  Copyright (c) 2014年 平江. All rights reserved.
//

#import "PJAppDelegate.h"
#import "PJBubbleView.h"

@implementation PJAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)doSelectedAction:(id)sender {
    NSLog(@"%s %@", __PRETTY_FUNCTION__, sender);
    NSSegmentedControl *btn = (NSSegmentedControl*)sender;
    NSUInteger bits = self.bubbleView.direction;
    
    for (NSInteger i = 0; i < btn.segmentCount; i++) {
        NSUInteger mask = (1 << i);
        if ([btn isSelectedForSegment:i]) {
            bits = bits | mask;
        } else {
            bits = bits & (~mask);
        }
        
        NSLog(@"%ld %ld", bits, mask);
    }
    [self.bubbleView setDirection: bits];
}
@end
