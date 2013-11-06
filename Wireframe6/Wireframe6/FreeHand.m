//
//  FreeHand.m
//  Wireframe6
//
//  Created by Alberto Morales on 11/6/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "FreeHand.h"

@implementation FreeHand

double const BEZIER_PATH_OFFSET = 200.0;
double const BEZIER_LENGTH_PARTS = 3.0;

-(id) initWithPath:(NSBezierPath *) thePath Between:(NSPoint) startPoint And: (NSPoint) endPoint {
    self = [super init];
    _bezierPath = thePath;
    _startPoint = startPoint;
    _endPoint = endPoint;
    return self;
}

- (void) setPath {
     NSLog(@"TO BE IMPLEMENTED BY CHILD CLASS");
}


@end
