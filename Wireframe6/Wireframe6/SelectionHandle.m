//
//  SelectionHandle.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/30/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "SelectionHandle.h"

@implementation SelectionHandle

-(id) initWithPoint:(CGPoint) thePoint AllowXChange:(BOOL) allowX AllowYChange: (BOOL) allowY {
    
    self = [super init];
    self.point = thePoint;
    self.allowXChange = allowX;
    self.allowYChange = allowY;
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
@end
