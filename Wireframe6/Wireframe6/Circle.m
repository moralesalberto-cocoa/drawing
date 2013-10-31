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


-(void) resetHandles {
    SelectionHandle *handle1 = [SelectionHandle handleAt:self.startPoint AllowXChange:YES AllowYChange:YES AffectsStartPoint:YES AffectsEndPoint:NO];
    SelectionHandle *handle8 = [SelectionHandle handleAt:self.endPoint AllowXChange:YES AllowYChange:YES AffectsStartPoint:NO AffectsEndPoint:YES];
    double midX = self.startPoint.x + ((self.endPoint.x - self.startPoint.x)/2);
    double midY = self.startPoint.y + ((self.endPoint.y - self.startPoint.y)/2);
    SelectionHandle *handle2 = [SelectionHandle handleAt:CGPointMake(midX, self.startPoint.y) AllowXChange:NO AllowYChange:YES AffectsStartPoint:YES AffectsEndPoint:NO];
    SelectionHandle *handle3 = [SelectionHandle handleAt:CGPointMake(self.endPoint.x, self.startPoint.y) AllowXChange:YES AllowYChange:YES AffectsStartPoint:YES AffectsEndPoint:NO];
    SelectionHandle *handle4 = [SelectionHandle handleAt:CGPointMake(self.startPoint.x, midY) AllowXChange:YES AllowYChange:NO AffectsStartPoint:YES AffectsEndPoint:NO];
    SelectionHandle *handle5 = [SelectionHandle handleAt:CGPointMake(self.endPoint.x, midY) AllowXChange:YES AllowYChange:NO AffectsStartPoint:NO AffectsEndPoint:YES];
    SelectionHandle *handle6 = [SelectionHandle handleAt:CGPointMake(self.startPoint.x, self.endPoint.y) AllowXChange:YES AllowYChange:YES AffectsStartPoint:YES AffectsEndPoint:NO];
    SelectionHandle *handle7 = [SelectionHandle handleAt:CGPointMake(midX, self.endPoint.y) AllowXChange:NO AllowYChange:YES AffectsStartPoint:NO AffectsEndPoint:YES];
    self.handles = [NSMutableArray arrayWithObjects:handle1, handle2, handle3, handle4, handle5, handle6, handle7, handle8, nil];
}


-(void) draw {
    [super draw]; // some general settings like color
    [self.bezierPath stroke];
}

-(void) doBezierPath {
    // reset the bezier path
    self.bezierPath = [NSBezierPath bezierPathWithOvalInRect:self.trackingRect];
}

-(void) resetTrackingRect {
    self.trackingRect = CGRectMake(self.startPoint.x, self.startPoint.y, self.endPoint.x-self.startPoint.x, self.endPoint.y-self.startPoint.y);
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
