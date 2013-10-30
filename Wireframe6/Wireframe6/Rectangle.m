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
    self.trackingRect = CGRectMake(self.startPoint.x, self.startPoint.y, self.endPoint.x-self.startPoint.x,self.endPoint.y-self.startPoint.y);
    
    // reset the bezier path
    self.bezierPath = [NSBezierPath bezierPathWithRect:self.trackingRect];
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
