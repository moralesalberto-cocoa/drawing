//
//  Grid.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/29/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "Grid.h"

@implementation Grid

-(id) initWithFrame:(NSRect)frame {
    self = [super init];
    self.frame = frame;
    self.startPoint = NSMakePoint(frame.origin.x, frame.origin.y+0.5);
    self.endPoint = NSMakePoint(frame.origin.x+frame.size.width, frame.origin.y+frame.size.height+0.5);
    self.bezierPath = [NSBezierPath bezierPath];
    self.increment = 35;
    return self;
}


-(void) drawGrid {
    [self drawBackground];
    [self drawLightColoredGrid];
}

-(void) drawBackground {
    [[NSColor whiteColor] set];
    [NSBezierPath fillRect:self.frame];
}

-(void) drawLightColoredGrid {
    [self setLineColor];
    [self drawVerticalLines];
    [self drawHorizontalLines];
    [self.bezierPath stroke];
}

-(void) setLineColor {
// #B5D8EB (181,216,235)
    double rFloat = 181/255.0f;
    double gFloat = 216/255.0f;
    double bFloat = 235/255.0f;
    
    [[NSColor colorWithRed:rFloat green:gFloat blue:bFloat alpha:1.0]set];
}

-(void) drawVerticalLines {
    double from = self.startPoint.x;
    double to = self.endPoint.x;
    while (from < to) {
        [self.bezierPath moveToPoint:NSMakePoint(from, self.startPoint.y)];
        [self.bezierPath lineToPoint:NSMakePoint(from, self.endPoint.y)];
        from += self.increment;
    }
    
}

-(void) drawHorizontalLines {
    double from = self.startPoint.y;
    double to = self.endPoint.y;
    while (from < to) {
        [self.bezierPath moveToPoint:NSMakePoint(self.startPoint.x, from)];
        [self.bezierPath lineToPoint:NSMakePoint(self.endPoint.x, from)];
        from += self.increment;
    }
}


@end
