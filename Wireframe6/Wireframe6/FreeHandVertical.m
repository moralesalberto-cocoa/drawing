//
//  FreeHandVertical.m
//  Wireframe6
//
//  Created by Alberto Morales on 11/6/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "FreeHandVertical.h"

@implementation FreeHandVertical

+(void) setPathFor: (NSBezierPath *) thePath Between:(NSPoint) startPoint And: (NSPoint) endPoint {
    [[[FreeHandVertical alloc] initWithPath:thePath Between:startPoint And:endPoint] setPath];
}

- (void) setPath {
    [_bezierPath moveToPoint:_startPoint];
    [_bezierPath curveToPoint:_endPoint controlPoint1:[self controlPoint1] controlPoint2:[self controlPoint2]];
}

- (NSPoint)controlPoint1 {
    double x = _startPoint.x+[self offsetX];
    double y = _startPoint.y + [self offsetY];
    return NSMakePoint(x, y);
}

-(NSPoint)controlPoint2 {
    double x = _endPoint.x-[self offsetX];
    double y = _endPoint.y - [self offsetY];
    return NSMakePoint(x, y);
}

-(double) offsetX {
    return ((_endPoint.y-_startPoint.y)/BEZIER_PATH_OFFSET);
}

-(double) offsetY {
    return ((_endPoint.y-_startPoint.y)/BEZIER_LENGTH_PARTS);
}

@end
