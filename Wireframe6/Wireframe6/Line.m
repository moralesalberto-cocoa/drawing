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
    return self;
}

-(void) resetTrackingRect {
    NSLog(@"TO BE IMPLEMENTED BY CHILD CLASS");
}


-(void) doBezierPath {
    // reset the bezier path
    [self.bezierPath removeAllPoints];
    [self.bezierPath moveToPoint:self.startPoint];
    [self.bezierPath lineToPoint:self.endPoint];
}





@end
