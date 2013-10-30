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
    self.trackingRect = CGRectMake(self.startPoint.x, self.startPoint.y, self.endPoint.x, thickness);
}


@end
