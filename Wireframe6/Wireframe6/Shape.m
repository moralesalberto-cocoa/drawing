//
//  Shape.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/29/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "Shape.h"

@implementation Shape

+(NSColor *) highlightColor {
    return [NSColor redColor];
}

+(NSColor *) defaultColor {
    return [NSColor blackColor];
}

-(id) init {
    self = [super init];
    self.isSelected = NO;
    self.isHandleSelected = NO;
    self.selectedHandle = nil;
    self.bezierPath = [NSBezierPath bezierPath];
    self.color = [Shape defaultColor];
    self.handles = [[NSMutableArray alloc] init];
    return self;
}

-(void) adjustStartAndEndPointWith:(CGPoint) pointOne And: (CGPoint) pointTwo {
    double startX = pointOne.x < pointTwo.x ? pointOne.x : pointTwo.x;
    double startY = pointOne.y < pointTwo.y ? pointOne.y : pointTwo.y;
    double endX = pointOne.x > pointTwo.x ? pointOne.x : pointTwo.x;
    double endY = pointOne.y > pointTwo.y ? pointOne.y : pointTwo.y;
    self.startPoint = CGPointMake(lroundf(startX)+0.5, lroundf(startY)+0.5);
    self.endPoint = CGPointMake(lroundf(endX)+0.5, lroundf(endY)+0.5);
}

-(void) resetWithStartPoint:(CGPoint) startP andEndPoint:(CGPoint) endP {
    
    [self adjustStartAndEndPointWith:startP And:endP];
    
    [self resetTrackingRect];
    
    [self resetHandles];
    
    // reset the bezier path to be implemented by the child class
    [self doBezierPath];
}


-(void) draw {
    [self.color set];
    if (self.isSelected == YES) {
        [self drawHandles];
    }
    // the rest of the method is implemented in the child class
    // make sure to call super first from the child class to draw the handles
}

-(void) drawHandles {
    for (SelectionHandle *handle in self.handles) {
        [handle draw];
    }
}

-(void) handleMouseDraggedTo:(CGPoint) endP {
    if (self.isHandleSelected == YES) {
        [self changeDimensionsDraggedTo:endP];
    }
    else {
        // move position
    }
}

-(void) changeDimensionsDraggedTo:(CGPoint) endP {
    NSPoint newStartPoint = [self.selectedHandle getNewStartPointFor:self.startPoint ShapeDraggedTo:endP];
    NSPoint newEndPoint = [self.selectedHandle getNewEndPointFor:self.endPoint ShapeDraggedTo:endP];
    [self resetWithStartPoint:newStartPoint andEndPoint:newEndPoint];
}



// count the shape rect and the selectionHandle rects
-(BOOL) isPointInShape:(CGPoint) point{
    BOOL foundPoint = (NSPointInRect(point, self.trackingRect) || [self findHandleFromPoint:point]);
    return foundPoint;
}

-(void) hover:(BOOL)doHover {
    if (doHover == YES) {
        self.color = [Shape highlightColor];
    }
    if(doHover == NO) {
        self.color = [Shape defaultColor];
    }
}

-(void) doBezierPath {
    NSLog(@"TO BE IMPLEMENTED BY CHILD CLASS");
}

-(void) resetTrackingRect {
    NSLog(@"TO BE IMPLEMENTED BY CHILD CLASS");
}


-(void) resetHandles {
    NSLog(@"TO BE IMPLEMENTED BY CHILD CLASS");
}

-(void) setSelectedFromPoint:(CGPoint)point {
    self.isSelected = YES;
    [self findAndSetSelectedHandleFromPoint:point];
}

-(void) findAndSetSelectedHandleFromPoint:(CGPoint) point {
    self.selectedHandle = [self findHandleFromPoint:point];
    if(self.selectedHandle != nil) {
        self.isHandleSelected = YES;
    }
}

-(void) unSetSelected {
    self.selectedHandle = nil;
    self.isHandleSelected = NO;
    self.isSelected = NO;
}

-(SelectionHandle *) findHandleFromPoint:(CGPoint) point {
    SelectionHandle *foundHandle = nil;
    for (SelectionHandle *handle in self.handles) {
        if(NSPointInRect(point, handle.rect)) {
            foundHandle = handle;
            break;
        }
    }
    return foundHandle;
}


/////
// Encoding and reading from filesystem
-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    self.bezierPath = [aDecoder decodeObjectForKey:@"bezierPath"];
    self.color = [aDecoder decodeObjectForKey:@"color"];
    return self;
}

-(void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.bezierPath forKey:@"bezierPath"];
    [aCoder encodeObject:self.color forKey:@"color"];
}


@end
