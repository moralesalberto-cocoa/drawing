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
    [self resetWithStartPoint:NSMakePoint(100.0, 300.0) andEndPoint:NSMakePoint(150.0, 350.0)];
    return self;
}

-(void) doBezierPath {
    // reset the bezier path
    self.bezierPath = [NSBezierPath bezierPathWithRect:self.trackingRect];
    
}


-(void) resetTrackingRect {
    self.trackingRect = NSMakeRect(self.startPoint.x, self.startPoint.y, self.endPoint.x-self.startPoint.x, self.endPoint.y-self.startPoint.y);
}

-(void) resetHandles {
    
    double midX = self.startPoint.x + ((self.endPoint.x - self.startPoint.x)/2);
    double midY = self.startPoint.y + ((self.endPoint.y - self.startPoint.y)/2);
    
    SelectionHandle *handle1 = [SelectionHandle handleAt:self.startPoint LocationId:1];
    SelectionHandle *handle2 = [SelectionHandle handleAt:NSMakePoint(midX, self.startPoint.y) LocationId:2];
    SelectionHandle *handle3 = [SelectionHandle handleAt:NSMakePoint(self.endPoint.x, self.startPoint.y) LocationId:3];
    SelectionHandle *handle4 = [SelectionHandle handleAt:NSMakePoint(self.endPoint.x, midY) LocationId:4];
    SelectionHandle *handle5 = [SelectionHandle handleAt:self.endPoint LocationId:5];
    SelectionHandle *handle6 = [SelectionHandle handleAt:NSMakePoint(midX, self.endPoint.y) LocationId:6];
    SelectionHandle *handle7 = [SelectionHandle handleAt:NSMakePoint(self.startPoint.x, self.endPoint.y) LocationId:7];
    SelectionHandle *handle8 = [SelectionHandle handleAt:NSMakePoint(self.startPoint.x, midY) LocationId:8];
    
    self.handles = [NSMutableArray arrayWithObjects:handle1, handle2, handle3, handle4, handle5, handle6, handle7, handle8, nil];
}



@end
