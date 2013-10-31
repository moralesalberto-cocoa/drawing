//
//  HorizontalLine.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/30/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "HorizontalLine.h"

@implementation HorizontalLine


-(id) init {
    self = [super init];
    [self resetWithStartPoint:CGPointMake(20.0, 50) andEndPoint:CGPointMake(100.0, 50)];
    return self;
}

-(void) resetTrackingRect {
    float thickness = 10.0;
    self.trackingRect = CGRectMake(self.startPoint.x, self.startPoint.y-(thickness/2.0), self.endPoint.x, thickness);
}

-(void) resetHandles {
    SelectionHandle *handle1 = [SelectionHandle handleAt:self.startPoint AllowXChange:YES AllowYChange:NO AffectsStartPoint:YES AffectsEndPoint:NO];
    SelectionHandle *handle2 = [SelectionHandle handleAt:self.endPoint AllowXChange:YES AllowYChange:NO AffectsStartPoint:NO AffectsEndPoint:YES];
    self.handles = [NSMutableArray arrayWithObjects:handle1, handle2, nil];
}

@end
