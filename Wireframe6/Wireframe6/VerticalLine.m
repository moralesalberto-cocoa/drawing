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
    self.trackingRect = CGRectMake(self.startPoint.x, self.startPoint.y, width, self.endPoint.y);
}


@end
