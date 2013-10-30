//
//  Line.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/29/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "Line.h"

@implementation Line


//////// To be implemented by child class

-(id) init {
    self = [super init];
    // this line to be implemented by child class, here we set a horizontal line
    [self resetWithStartPoint:CGPointMake(20.0, 50) andEndPoint:CGPointMake(100.0, 50)];
    return self;
}

-(void) resetTrackingRect {
    NSLog(@"TO BE IMPLEMENTED BY CHILD CLASS");
}

-(void) resetHandles {
    SelectionHandle *handle1 = [[SelectionHandle alloc] initWithPoint:self.startPoint];
    SelectionHandle *handle2 = [[SelectionHandle alloc] initWithPoint:self.endPoint];
    self.handles = [NSMutableArray arrayWithObjects:handle1, handle2, nil];
}

//////////




// drawing
-(void) draw {
    [super draw]; // some general settings like color
    [self.bezierPath stroke];
}

-(void) resetWithStartPoint:(CGPoint) startP andEndPoint:(CGPoint) endP {
    
    // round and add 0.5 to make thin lines
    self.startPoint = CGPointMake(lroundf(startP.x)+0.5, lroundf(startP.y)+0.5);
    self.endPoint = CGPointMake(lroundf(endP.x)+0.5, lroundf(endP.y)+0.5);;
    
    [self resetTrackingRect];
    
    [self resetHandles];
    
    // reset the bezier path
    [self.bezierPath removeAllPoints];
    [self.bezierPath moveToPoint:self.startPoint];
    [self.bezierPath lineToPoint:self.endPoint];
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



// custom description of line useful when printing to console
-(NSString *) description {
    return [NSString stringWithFormat:@"Line instance located at x1: %f, y1: %f, x2:%f, y2:%f", self.startPoint.x, self.startPoint.y, self.endPoint.x, self.endPoint.y];
}


@end
