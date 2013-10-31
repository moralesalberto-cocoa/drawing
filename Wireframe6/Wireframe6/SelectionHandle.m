//
//  SelectionHandle.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/30/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//
// Location Ids:
// 7----6----5
// |         |
// 8         4
// |         |
// 1----2----3
//

#import "SelectionHandle.h"

@implementation SelectionHandle

# pragma mark  *** init ***

+(id) handleAt:(NSPoint) atPoint LocationId: (int) theLocationId {
    SelectionHandle *handle = [[SelectionHandle alloc] initWithPoint:atPoint LocationId:theLocationId];
    return handle;
}

+ (NSRect) newBoundsFromBounds:(NSRect) old forHandle:(int) whichOne withDelta:(NSPoint) p {
    // Taken from:
    // http://en.wikibooks.org/wiki/Programming_Mac_OS_X_with_Cocoa_for_Beginners/Implementing_Wikidraw
    //
    
    NSRect nb = old;
    switch( whichOne )
    {
        case 4:
            nb.size.width += p.x;
            
            NSLog(@"Width: %f", nb.size.width);
            break;
            
        case 6:
            nb.size.height += p.y;
            break;
            
        case 2:
            nb.size.height -= p.y;
            nb.origin.y += p.y;
            break;
            
        case 8:
            nb.size.width -= p.x;
            nb.origin.x += p.x;
            break;
            
        case 1:
            nb.size.width -= p.x;
            nb.origin.x += p.x;
            nb.size.height -= p.y;
            nb.origin.y += p.y;
            break;
            
        case 3:
            nb.size.height -= p.y;
            nb.origin.y += p.y;
            nb.size.width += p.x;
            break;
            
        case 5:
            nb.size.width += p.x;
            nb.size.height += p.y;
            break;
            
        case 7:
            nb.size.width -= p.x;
            nb.origin.x += p.x;
            nb.size.height += p.y;
            break;
    }
    
    return nb;
}


-(id) initWithPoint:(NSPoint) thePoint LocationId:(int) theLocationId {
    self = [super init];
    self.point = thePoint;
    self.locationId = theLocationId;
    [self setupRect];
    return self;
}

# pragma mark *** Rect

-(void) setupRect {
    double handleWidth = 6.0f;
    double handleHalfWidth = 6.0f / 2.0f;
    
    double x = self.point.x - handleHalfWidth;
    double y = self.point.y - handleHalfWidth;
    double width = handleWidth;
    double height = handleWidth;
    
    self.rect = NSMakeRect(x, y, width, height);
    
}

# pragma *** resizing ***

-(NSRect) getNewBoundsFromBounds:(NSRect) previousRect withDelta:(NSPoint) newPoint {
    return [SelectionHandle newBoundsFromBounds:previousRect forHandle:self.locationId withDelta:newPoint];
}


# pragma *** draw

-(void) draw {
    
    // Draw the shadow of the handle.
    NSRect handleShadowBounds = NSOffsetRect(self.rect, 1.0f, 1.0f);
    [[NSColor controlDarkShadowColor] set];
    
    NSRectFill(handleShadowBounds);
    
    // Draw the handle itself.
    [[NSColor knobColor] set];
    NSRectFill(self.rect);
    
}


# pragma *** point in selection handle

-(BOOL) isPointInside:(NSPoint) point {
    return NSPointInRect(point, self.rect);
}



@end
