//
//  PJBubbleView.m
//  ChatBubble
//
//  Created by 平江 on 14-9-9.
//  Copyright (c) 2014年 平江. All rights reserved.
//

#import "PJBubbleView.h"

@implementation PJBubbleView

@synthesize strokeColor, fillColor, triangleHeight, triangleWidth, trianglePositionRatio, direction, cornerRadius;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        
        [self setFillColor:[NSColor colorWithCalibratedRed:0.851 green:0.922 blue:0.98 alpha:1]];
        //[self setStrokeColor:[NSColor colorWithCalibratedRed:0.761 green:843 blue:0.918 alpha:1]];
        [self setStrokeColor:[NSColor blackColor]];
        [self setDirection:0];
        [self setTriangleHeight:20];
        [self setTriangleWidth:20];
        [self setTrianglePositionRatio:0.2];
        [self setCornerRadius:10];
        
        [self addObserver:self forKeyPath:@"direction" options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"strokeColor" options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"fillColor" options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"cornerRadius" options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"triangleWidth" options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"triangleHeight" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"direction"];
}

- (void)didChangeValueForKey:(NSString *)key {
    NSLog(@"%s %@", __PRETTY_FUNCTION__, key);
    [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    CGFloat x = self.bounds.origin.x + self.triangleWidth, y = self.bounds.origin.y + self.triangleHeight;
    CGFloat w = self.bounds.size.width - 2*self.triangleWidth, h = self.bounds.size.height - 2*self.triangleHeight;
    NSPoint p = NSMakePoint(x, y), cp = NSMakePoint(x, y);
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path setLineWidth:1];
    
    p.y = y + self.cornerRadius;
    [path moveToPoint:p];
    p.x = x + self.cornerRadius;
    p.y = y;
    [path curveToPoint:p controlPoint1:cp controlPoint2:cp];
    // bottom
    if (self.direction & PJDirectionBottom) {
        p.x = x + self.cornerRadius;
        [path lineToPoint:p];
        p.x += self.triangleWidth;
        cp.x = x + self.cornerRadius;
        cp.y = y - self.triangleHeight;
        [path curveToPoint:p controlPoint1:cp controlPoint2:cp];
    }
    
    p.x = x + (w - self.cornerRadius);
    [path lineToPoint:p];
    p.x = x + w;
    p.y = y + self.cornerRadius;
    cp.x = x + w;
    cp.y = y;
    [path curveToPoint:p controlPoint1:cp controlPoint2:cp];
    // right
    if (self.direction & PJDirectionRight) {
        p.y = y + self.cornerRadius;
        [path lineToPoint:p];
        p.y += self.triangleHeight;
        cp.x = x + w + self.triangleWidth;
        cp.y = y + self.cornerRadius;
        [path curveToPoint:p controlPoint1:cp controlPoint2:cp];
    }
    
    p.y = y + h - self.cornerRadius;
    [path lineToPoint:p];
    p.x -= self.cornerRadius;
    p.y += self.cornerRadius;
    cp.x = x + w;
    cp.y = y + h;
    [path curveToPoint:p controlPoint1:cp controlPoint2:cp];
    // top
    if (self.direction & PJDirectionTop) {
        p.x = x + w - self.cornerRadius;
        [path lineToPoint:p];
        p.x -= self.triangleWidth;
        cp.x = x + w - self.cornerRadius;
        cp.y = y + h + self.triangleHeight;
        [path curveToPoint:p controlPoint1:cp controlPoint2:cp];
    }
    
    p.x = x + self.cornerRadius;
    [path lineToPoint:p];
    p.x = x;
    p.y = y + h - self.cornerRadius;
    cp.x = x;
    cp.y = y + h;
    [path curveToPoint:p controlPoint1:cp controlPoint2:cp];
    // left
    if (self.direction & PJDirectionLeft) {
        p.y = y + h - self.cornerRadius;
        [path lineToPoint:p];
        p.y -= self.triangleHeight;
        cp.x -= self.triangleWidth;
        cp.y = y + h - self.cornerRadius;
        [path curveToPoint:p controlPoint1:cp controlPoint2:cp];
    }
    p.y = y + self.cornerRadius;
    [path lineToPoint:p];
    
    [self.strokeColor setStroke];
    [path stroke];
    [self.fillColor setFill];
    [path fill];
}

@end
