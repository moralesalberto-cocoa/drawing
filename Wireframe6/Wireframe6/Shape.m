//
//  Shape.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/29/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "Shape.h"

@implementation Shape

#pragma mark *** Constants ***

+(NSColor *) highlightColor {
    return [NSColor redColor];
}

+(NSColor *) defaultColor {
    return [NSColor blackColor];
}

#pragma mark *** init ***
-(id) init {
    self = [super init];
    self.isSelected = NO;
    self.selectedHandle = nil;
    self.bezierPath = [NSBezierPath bezierPath];
    self.color = [Shape defaultColor];
    self.handles = [[NSMutableArray alloc] init];
    return self;
}

#pragma mark *** Shape location/size ***


-(void) resetWithStartPoint:(NSPoint) startP andEndPoint:(NSPoint) endP {
    self.startPoint = startP;
    self.endPoint = endP;
    [self resetTrackingRect];
    [self resetHandles];
    [self doBezierPath]; // to be implemented by the child class
}

-(void) resetWithRect:(NSRect) rect {
    // for lines we need override
    NSPoint startP = rect.origin;
    NSPoint endP = NSMakePoint(rect.origin.x + rect.size.width, rect.origin.y+rect.size.height);
    [self resetWithStartPoint:startP andEndPoint:endP];
}

-(void) changeDimensionsDraggedTo:(NSPoint) deltaPoint {
    NSRect newBounds = [self.selectedHandle getNewBoundsFromBounds:self.trackingRect withDelta:deltaPoint];
    [self resetWithRect:newBounds];
}

- (void) offsetLocationByX:(float) x byY:(float) y {
    // need to override for lines
    NSRect bounds = self.trackingRect;
    bounds.origin.x += x;
    bounds.origin.y += y;
    [self resetWithRect:bounds];
}

#pragma mark *** Mouse Events ***

-(void) handleMouseDraggedTo:(NSPoint) endP {
    NSPoint deltaPoint = [self getDeltaPointFromNewPoint:endP];
    if (self.selectedHandle != nil) {
        [self changeDimensionsDraggedTo:deltaPoint];
    }
    else {
        // move position
        [self offsetLocationByX:deltaPoint.x byY:deltaPoint.y];
    }
}

-(NSPoint) getDeltaPointFromNewPoint:(NSPoint) newPoint {
    NSPoint deltaPoint;
    deltaPoint.x = newPoint.x - self.anchorPoint.x;
    deltaPoint.y = newPoint.y - self.anchorPoint.y;
    self.anchorPoint = newPoint;
    return deltaPoint;
}

-(void) hover:(BOOL)doHover {
    if (doHover == YES) {
        self.color = [Shape highlightColor];
    }
    if(doHover == NO) {
        self.color = [Shape defaultColor];
    }
}

#pragma mark *** Drawing ***
-(void) draw {
    
    [self.color set];
    if (self.isSelected == YES) {
        [self drawHandles];
    }
    [self.bezierPath stroke];
}

-(void) drawHandles {
    for (SelectionHandle *handle in self.handles) {
        [handle draw];
    }
}

-(void) doBezierPath {
    NSLog(@"TO BE IMPLEMENTED BY CHILD CLASS");
}


#pragma mark *** Resets ***

-(void) resetTrackingRect {
    NSLog(@"TO BE IMPLEMENTED BY CHILD CLASS");
}


-(void) resetHandles {
    NSLog(@"TO BE IMPLEMENTED BY CHILD CLASS");
}


#pragma mark *** Shape selection ***

-(BOOL) isPointInShape:(NSPoint) point{
    BOOL foundPoint = (NSPointInRect(point, self.trackingRect) || [self findHandleFromPoint:point]);
    return foundPoint;
}

-(void) setSelectedFromPoint:(NSPoint)point {
    self.isSelected = YES;
    self.anchorPoint = point;
    [self findAndSetSelectedHandleFromPoint:point];
}

-(void) findAndSetSelectedHandleFromPoint:(NSPoint) point {
    self.selectedHandle = [self findHandleFromPoint:point];
}

-(void) unSetSelected {
    self.selectedHandle = nil;
    self.isSelected = NO;
}

-(SelectionHandle *) findHandleFromPoint:(NSPoint) point {
    SelectionHandle *foundHandle = nil;
    for (SelectionHandle *handle in self.handles) {
        if([handle isPointInside:point]) {
            foundHandle = handle;
            break;
        }
    }
    return foundHandle;
}


#pragma mark *** Encoding/Decoding from filesystem ***

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    self.bezierPath = [aDecoder decodeObjectForKey:@"bezierPath"];
    self.color = [aDecoder decodeObjectForKey:@"color"];
    NSPoint startP = [aDecoder decodePointForKey:@"startPoint"];
    NSPoint endP = [aDecoder decodePointForKey:@"endPoint"];
    [self resetWithStartPoint:startP andEndPoint:endP];
    return self;
}

-(void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.bezierPath forKey:@"bezierPath"];
    [aCoder encodeObject:self.color forKey:@"color"];
    [aCoder encodePoint:self.startPoint forKey:@"startPoint"];
    [aCoder encodePoint:self.endPoint forKey:@"endPoint"];
}

#pragma mark *** Debugging ***
-(NSString *) description {
    return [NSString stringWithFormat:@"Shape located at x1: %f, y1: %f, x2:%f, y2:%f", self.startPoint.x, self.startPoint.y, self.endPoint.x, self.endPoint.y];
}


@end
