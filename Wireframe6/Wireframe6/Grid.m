//
//  Grid.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/29/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "Grid.h"

@implementation Grid

-(id) initWithFrame:(CGRect)frame {
    
    self = [super init];
    self.frame = frame;
    self.startPoint = frame.origin;
    self.endPoint = CGPointMake(frame.origin.x+frame.size.width, frame.origin.y+frame.size.height);
    self.bezierPath = [NSBezierPath bezierPath];
    self.increment = 35;
    return self;
}


-(void) drawGrid {
    
    [[NSColor whiteColor] set];
    [NSBezierPath fillRect:self.frame];
    
    [self setLineColor];
    [self drawVerticalLines];
    [self drawHorizontalLines];
    [self.bezierPath stroke];
}

-(void) setLineColor {
    
    double rFloat = 226/255.0f;
    double gFloat = 232/255.0f;
    double bFloat = 237/255.0f;
    [[NSColor colorWithCalibratedRed:rFloat green:gFloat blue:bFloat alpha:0.8] set];
    
}

-(void) drawVerticalLines {
    double from = self.startPoint.x;
    double to = self.endPoint.x;
    while (from < to) {
        [self.bezierPath moveToPoint:CGPointMake(from, self.startPoint.y)];
        [self.bezierPath lineToPoint:CGPointMake(from, self.endPoint.y)];
        
        from += self.increment;
    }
    
}

-(void) drawHorizontalLines {
    double from = self.startPoint.y;
    double to = self.endPoint.y;
    while (from < to) {
        [self.bezierPath moveToPoint:CGPointMake(self.startPoint.x, from)];
        [self.bezierPath lineToPoint:CGPointMake(self.endPoint.x, from)];
        
        from += self.increment;
    }
}


@end
