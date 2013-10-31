//
//  VerticalLine.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/30/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "VerticalLine.h"

@implementation VerticalLine


-(id) init {
    self = [super init];
    [self resetWithStartPoint:CGPointMake(200.0, 500) andEndPoint:CGPointMake(200.0, 550)];
    return self;
}

-(void) resetTrackingRect {
    float width = 10.0;
    self.trackingRect = CGRectMake(self.startPoint.x-(width/2.0), self.startPoint.y, width, self.endPoint.y);
}


-(void) resetHandles {
    SelectionHandle *handle1 = [SelectionHandle handleAt:self.startPoint AllowXChange:NO AllowYChange:YES AffectsStartPoint:YES AffectsEndPoint:NO];
    SelectionHandle *handle2 = [SelectionHandle handleAt:self.endPoint AllowXChange:NO AllowYChange:YES AffectsStartPoint:NO AffectsEndPoint:YES];
    self.handles = [NSMutableArray arrayWithObjects:handle1, handle2, nil];
}

@end
