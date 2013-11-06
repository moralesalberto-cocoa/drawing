//
//  BrowserShape.m
//  Wireframe6
//
//  Created by amorales on 11/6/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "BrowserShape.h"

@implementation BrowserShape


-(void) doBezierPath {
    // reset the bezier path
    //self.bezierPath = [NSBezierPath bezierPathWithRect:self.trackingRect];
    
    [self.bezierPath removeAllPoints];
    
    
    [self bezierBorderRect];
    
    [self bezierTopLine];
    
    [self bezierSideLine];
    
    [self bezierScrollLine1];
    
    [self bezierScrollLine2];
    
    
}

-(void) bezierScrollLine1 {
    double offsetX = self.trackingRect.size.width/15.0;
    double offsetY = self.trackingRect.size.height/2.0;
    
    NSPoint startP = NSMakePoint(self.trackingRect.origin.x + self.trackingRect.size.width - offsetX, self.startPoint.y + offsetY);
    NSPoint endP = NSMakePoint(self.trackingRect.origin.x + self.trackingRect.size.width, self.startPoint.y + offsetY);
    
    [FreeHandHorizontal setPathFor:self.bezierPath Between:startP And:endP];
}

-(void) bezierScrollLine2 {
    double offsetX = self.trackingRect.size.width/15.0;
    double offsetY = self.trackingRect.size.height/2.2;
    
    NSPoint startP = NSMakePoint(self.trackingRect.origin.x + self.trackingRect.size.width - offsetX, self.startPoint.y + offsetY);
    NSPoint endP = NSMakePoint(self.trackingRect.origin.x + self.trackingRect.size.width, self.startPoint.y + offsetY);
    
    [FreeHandHorizontal setPathFor:self.bezierPath Between:startP And:endP];
}

-(void) bezierSideLine {
    double offsetX = self.trackingRect.size.width/15.0;
    
    double offsetY = self.trackingRect.size.height/15.0;
    
    NSPoint endP = NSMakePoint(self.trackingRect.origin.x + self.trackingRect.size.width - offsetX, self.startPoint.y + self.trackingRect.size.height - offsetY);
    
    NSPoint startP = NSMakePoint(self.trackingRect.origin.x + self.trackingRect.size.width - offsetX, self.startPoint.y);
    
    [FreeHandVertical setPathFor:self.bezierPath Between:startP And:endP];
    
}


-(void) bezierTopLine {
    double offsetY = self.trackingRect.size.height/15.0;
    
    NSPoint startP = NSMakePoint(self.trackingRect.origin.x, self.startPoint.y +self.trackingRect.size.height - offsetY);
    
    NSPoint endP = NSMakePoint(self.startPoint.x+self.trackingRect.size.width, self.startPoint.y+ self.trackingRect.size.height - offsetY);
    
    [FreeHandHorizontal setPathFor:self.bezierPath Between:startP And:endP];
    
}

-(void) bezierBorderRect {
    [FreeHandHorizontal setPathFor:self.bezierPath Between:self.startPoint And:NSMakePoint(self.trackingRect.origin.x+self.trackingRect.size.width, self.trackingRect.origin.y)];
    
    [FreeHandHorizontal setPathFor:self.bezierPath Between:NSMakePoint(self.trackingRect.origin.x, self.trackingRect.origin.y+self.trackingRect.size.height) And:NSMakePoint(self.trackingRect.origin.x, self.trackingRect.origin.y)];
    
    [FreeHandHorizontal setPathFor:self.bezierPath Between:NSMakePoint(self.trackingRect.origin.x+self.trackingRect.size.width, self.trackingRect.origin.y) And:NSMakePoint(self.trackingRect.origin.x+self.trackingRect.size.width, self.trackingRect.origin.y+self.trackingRect.size.height)];
    
    [FreeHandHorizontal setPathFor:self.bezierPath Between:NSMakePoint(self.trackingRect.origin.x, self.trackingRect.origin.y+self.trackingRect.size.height) And:NSMakePoint(self.trackingRect.origin.x+self.trackingRect.size.width, self.trackingRect.origin.y+self.trackingRect.size.height)];
}

@end
