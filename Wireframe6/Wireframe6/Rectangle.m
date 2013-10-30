//
//  Rectangle.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/30/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle
-(id) init {
    self = [super init];
    [self resetWithStartPoint:CGPointMake(100.0, 300.0) andEndPoint:CGPointMake(150.0, 350.0)];
    return self;
}

-(void) resetWithStartPoint:(CGPoint) startP andEndPoint:(CGPoint) endP {
    
    // round and add 0.5 to make thin lines
    self.startPoint = CGPointMake(lroundf(startP.x)+0.5, lroundf(startP.y)+0.5);
    self.endPoint = CGPointMake(lroundf(endP.x)+0.5, lroundf(endP.y)+0.5);;
    
    // reset the tracking rect
    [self resetTrackingRect];
    [self resetHandles];
    
    // reset the bezier path
    self.bezierPath = [NSBezierPath bezierPathWithRect:self.trackingRect];
}


-(void) draw {
    [super draw]; // some general settings like color
    [self.bezierPath stroke];
}

-(void) resetTrackingRect {
    self.trackingRect = CGRectMake(self.startPoint.x, self.startPoint.y, self.endPoint.x-self.startPoint.x, self.endPoint.y-self.startPoint.y);
}

-(void) resetHandles {
    SelectionHandle *handle1 = [[SelectionHandle alloc] initWithPoint:self.startPoint AllowXChange:YES AllowYChange:YES];
    SelectionHandle *handle8 = [[SelectionHandle alloc] initWithPoint:self.endPoint AllowXChange:YES AllowYChange:YES];
    double midX = self.startPoint.x + ((self.endPoint.x - self.startPoint.x)/2);
    double midY = self.startPoint.y + ((self.endPoint.y - self.startPoint.y)/2);
    SelectionHandle *handle2 = [[SelectionHandle alloc] initWithPoint:CGPointMake(midX, self.startPoint.y) AllowXChange:NO AllowYChange:YES];
    SelectionHandle *handle3 = [[SelectionHandle alloc] initWithPoint:CGPointMake(self.endPoint.x, self.startPoint.y) AllowXChange:YES AllowYChange:YES];
    SelectionHandle *handle4 = [[SelectionHandle alloc] initWithPoint:CGPointMake(self.startPoint.x, midY) AllowXChange:YES AllowYChange:NO];
    SelectionHandle *handle5 = [[SelectionHandle alloc] initWithPoint:CGPointMake(self.endPoint.x, midY) AllowXChange:YES AllowYChange:NO];
    SelectionHandle *handle6 = [[SelectionHandle alloc] initWithPoint:CGPointMake(self.startPoint.x, self.endPoint.y) AllowXChange:YES AllowYChange:YES ];
    SelectionHandle *handle7 = [[SelectionHandle alloc] initWithPoint:CGPointMake(midX, self.endPoint.y) AllowXChange:NO AllowYChange:YES];
    self.handles = [NSMutableArray arrayWithObjects:handle1, handle2, handle3, handle4, handle5, handle6, handle7, handle8, nil];
}


// Encoding and reading
-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    NSPoint startP = [aDecoder decodePointForKey:@"startPoint"];
    NSPoint endP = [aDecoder decodePointForKey:@"endPoint"];
    [self resetWithStartPoint:startP andEndPoint:endP];
    return self;
}

-(void) encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
    [aCoder encodePoint:self.startPoint forKey:@"startPoint"];
    [aCoder encodePoint:self.endPoint forKey:@"endPoint"];
    
}

// useful when printing to console
-(NSString *) description {
    return [NSString stringWithFormat:@"Line instance located at x1: %f, y1: %f, x2:%f, y2:%f", self.startPoint.x, self.startPoint.y, self.endPoint.x, self.endPoint.y];
}
@end
