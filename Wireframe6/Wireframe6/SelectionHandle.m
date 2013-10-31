//
//  SelectionHandle.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/30/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "SelectionHandle.h"

@implementation SelectionHandle

+(id) handleAt:(CGPoint) atPoint AllowXChange: (BOOL) allowX AllowYChange: (BOOL) allowY AffectsStartPoint:(BOOL) affectsStartP AffectsEndPoint: (BOOL) affectsEndP {
    SelectionHandle *handle = [[SelectionHandle alloc] initWithPoint:atPoint AllowXChange:allowX AllowYChange:allowY AffectsStartP:affectsStartP AffectsEndPoint:affectsEndP];
    return handle;
}


-(id) initWithPoint:(CGPoint) thePoint AllowXChange:(BOOL) allowX AllowYChange:(BOOL) allowY AffectsStartP:(BOOL) affectsStartP AffectsEndPoint: (BOOL) affectsEndP{
    self = [super init];
    self.point = thePoint;
    self.allowXChange = allowX;
    self.allowYChange = allowY;
    self.affectsStartPoint = affectsStartP;
    self.affectsEndPoint = affectsEndP;
    [self setupRect];
    return self;
}



-(void) setupRect {
    CGFloat handleWidth = 6.0f;
    CGFloat handleHalfWidth = 6.0f / 2.0f;
    
    // Figure out a rectangle that's centered on the point but lined up with device pixels.
    double x = self.point.x - handleHalfWidth;
    double y = self.point.y - handleHalfWidth;
    double width = handleWidth;
    double height = handleWidth;
    
    self.rect = CGRectMake(x, y, width, height);
    
}

-(void) draw {
    
    // Draw the shadow of the handle.
    NSRect handleShadowBounds = NSOffsetRect(self.rect, 1.0f, 1.0f);
    [[NSColor controlDarkShadowColor] set];
    
    NSRectFill(handleShadowBounds);
    
    // Draw the handle itself.
    [[NSColor knobColor] set];
    NSRectFill(self.rect);
    
}

-(CGPoint) getNewStartPointFor:(CGPoint)startPoint ShapeDraggedTo:(CGPoint) endDragPoint {
    CGPoint newStartPoint = CGPointMake(startPoint.x, startPoint.y);
    if (self.affectsStartPoint == YES) {
        
        
        double changeInX = endDragPoint.x - self.point.x;
        double changeInY = endDragPoint.y - self.point.y;
        
        double newStartPointX = startPoint.x;
        double newStartPointY = startPoint.y;
        
        if (self.allowXChange == YES) {
            newStartPointX += changeInX;
        }
        
        if(self.allowYChange == YES) {
            newStartPointY += changeInY;
        }
        
        newStartPoint = CGPointMake(newStartPointX, newStartPointY);
    }
    return newStartPoint;
    
}

-(CGPoint) getNewEndPointFor:(CGPoint)endPoint ShapeDraggedTo:(CGPoint) endDragPoint {
    CGPoint newEndPoint = CGPointMake(endPoint.x, endPoint.y);
    if (self.affectsEndPoint == YES) {
        
        double changeInX = endDragPoint.x - self.point.x;
        double changeInY = endDragPoint.y - self.point.y;
        
        double newStartPointX = endPoint.x;
        double newStartPointY = endPoint.y;
        
        if (self.allowXChange == YES) {
            newStartPointX += changeInX;
        }
        
        if(self.allowYChange == YES) {
            newStartPointY += changeInY;
        }
        
        newEndPoint = CGPointMake(newStartPointX, newStartPointY);
    }
    return newEndPoint;
    
}


@end
