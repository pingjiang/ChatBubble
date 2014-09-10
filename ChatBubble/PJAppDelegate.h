//
//  PJAppDelegate.h
//  ChatBubble
//
//  Created by 平江 on 14-9-9.
//  Copyright (c) 2014年 平江. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class PJBubbleView;

@interface PJAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet PJBubbleView *bubbleView;

- (IBAction)doSelectedAction:(id)sender;

@end
