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
    self.trackingThickness = 10.0;
    [self resetWithStartPoint:NSMakePoint(20.0, 50) andEndPoint:NSMakePoint(100.0, 50)];
    return self;
}

-(void) resetTrackingRect {
    float thickness = self.trackingThickness;
    self.trackingRect = NSMakeRect(self.startPoint.x, self.startPoint.y-(thickness/2.0), self.endPoint.x-self.startPoint.x, thickness);
}

-(void) doBezierPath {
    // reset the bezier path
    [self.bezierPath removeAllPoints];
    [FreeHandHorizontal setPathFor:self.bezierPath Between:self.startPoint And:self.endPoint];
}

-(void) resetHandles {
    SelectionHandle *handle1 = [SelectionHandle handleAt:self.startPoint LocationId:8];
    SelectionHandle *handle2 = [SelectionHandle handleAt:self.endPoint LocationId:4];
    self.handles = [NSMutableArray arrayWithObjects:handle1, handle2, nil];
}

// have to adapt this for the lines which are not a rects
-(void) resetWithRect:(NSRect) rect {
    NSPoint startP = NSMakePoint(rect.origin.x, self.startPoint.y);
    NSPoint endP = NSMakePoint(rect.origin.x + rect.size.width, self.startPoint.y);
    [self resetWithStartPoint:startP andEndPoint:endP];
}




@end
