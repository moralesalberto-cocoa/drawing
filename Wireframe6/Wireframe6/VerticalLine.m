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
    [self resetWithStartPoint:NSMakePoint(200.0, 500) andEndPoint:NSMakePoint(200.0, 550)];
    return self;
}

-(void) resetTrackingRect {
    float width = 10.0;
    self.trackingRect = NSMakeRect(self.startPoint.x-(width/2.0), self.startPoint.y, width, self.endPoint.y-self.startPoint.y);
}

-(void) doBezierPath {
    // reset the bezier path
    [self.bezierPath removeAllPoints];
    [FreeHandVertical setPathFor:self.bezierPath Between:self.startPoint And:self.endPoint];
}

-(void) resetHandles {
    SelectionHandle *handle1 = [SelectionHandle handleAt:self.startPoint LocationId:2];
    SelectionHandle *handle2 = [SelectionHandle handleAt:self.endPoint LocationId:6];
    self.handles = [NSMutableArray arrayWithObjects:handle1, handle2, nil];
}

// have to adapt this for the lines which are not a rects
-(void) resetWithRect:(NSRect) rect {
    NSPoint startP = NSMakePoint(self.startPoint.x, rect.origin.y);
    NSPoint endP = NSMakePoint(self.startPoint.x, rect.origin.y + rect.size.height);
    [self resetWithStartPoint:startP andEndPoint:endP];
}

@end
