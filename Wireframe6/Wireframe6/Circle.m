//
//  Circle.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/30/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "Circle.h"

@implementation Circle

-(id) init {
    self = [super init];
    [self resetWithStartPoint:CGPointMake(50.0, 200.0) andEndPoint:CGPointMake(100.0, 250.0)];
    return self;
}

-(void) resetWithStartPoint:(CGPoint) startP andEndPoint:(CGPoint) endP {
    
    // rectangle from these two points
    self.startPoint = startP;
    self.endPoint = endP;
    
    // reset the tracking rect
    self.trackingRect = CGRectMake(self.startPoint.x, self.startPoint.y, self.endPoint.x-self.startPoint.x,self.endPoint.y-self.startPoint.y);
    
    // reset the bezier path
    self.bezierPath = [NSBezierPath bezierPathWithOvalInRect:self.trackingRect];
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
@end
