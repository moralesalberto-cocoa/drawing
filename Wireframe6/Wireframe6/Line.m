//
//  Line.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/29/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "Line.h"

@implementation Line

-(id) init {
    self = [super init];
    [self resetWithStartPoint:CGPointMake(20.0, 50) andEndPoint:CGPointMake(100.0, 50)];
    return self;
}

-(void) resetWithStartPoint:(CGPoint) startP andEndPoint:(CGPoint) endP {
    
    self.startPoint = startP;
    self.endPoint = endP;
    
    // reset the tracking rect
    float thickness = 10.0;
    self.trackingRect = CGRectMake(self.startPoint.x, self.startPoint.y, self.endPoint.x, thickness);
    
    // reset the bezier path
    [self.bezierPath removeAllPoints];
    [self.bezierPath moveToPoint:self.startPoint];
    [self.bezierPath lineToPoint:self.endPoint];
}


-(void) draw {

    [super draw]; // some general settings like color
    
    [self.bezierPath stroke];
}

// useful when printing to console
-(NSString *) description {
    return [NSString stringWithFormat:@"Line instance located at x1: %f, y1: %f, x2:%f, y2:%f", self.startPoint.x, self.startPoint.y, self.endPoint.x, self.endPoint.y];
}

-(void) draggedFromPoint:(NSPoint) from ToPoint:(NSPoint) to {
    double newStartX = self.startPoint.x + (to.x - from.x);
    double newStartY = self.startPoint.y - (from.y - to.y);
    double newEndX = self.endPoint.x + (to.x - from.x);
    double newEndY = self.endPoint.y - (from.y - to.y);
    
    [self resetWithStartPoint:CGPointMake(newStartX, newStartY) andEndPoint:CGPointMake(newEndX, newEndY)];

}



@end
