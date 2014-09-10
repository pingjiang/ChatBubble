//
//  PJBubbleView.h
//  ChatBubble
//
//  Created by 平江 on 14-9-9.
//  Copyright (c) 2014年 平江. All rights reserved.
//

#import <Cocoa/Cocoa.h>

enum {
    PJDirectionTop = 1,
    PJDirectionRight = 2,
    PJDirectionBottom = 4,
    PJDirectionLeft = 8
};
typedef NSUInteger PJDirection;

@interface PJBubbleView : NSView

@property PJDirection direction;
@property NSColor *strokeColor;
@property NSColor *fillColor;
@property CGFloat triangleWidth;
@property CGFloat triangleHeight;
@property CGFloat trianglePositionRatio;
@property CGFloat cornerRadius;


@end
