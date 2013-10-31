//
//  DrawingView.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/30/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView

#pragma mark *** init ***

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.shapes = [NSMutableArray arrayWithObjects: nil];
        self.draggingSelectedShape = NO;
        self.selectedShape = nil;
        self.hoverShape = nil;
    }
    return self;
}


#pragma mark *** drawRect ***

- (void)drawRect:(NSRect)dirtyRect {
    for (Shape *shape in self.shapes) {
        [shape draw];
    }
}


#pragma mark *** New Shapes Added ***

-(HorizontalLine *) newHorizontalLine {
    HorizontalLine * horizontalLine = [[HorizontalLine alloc] init];
    [self addShape:horizontalLine];
    return horizontalLine;
}
-(VerticalLine *) newVerticalLine {
    VerticalLine * verticalLine = [[VerticalLine alloc] init];
    [self addShape:verticalLine];
    return verticalLine;
}

-(Circle *) newCircle {
    Circle * circle = [[Circle alloc] init];
    [self addShape:circle];
    return circle;
}

-(Rectangle *) newRectangle {
    Rectangle * rectangle = [[Rectangle alloc] init];
    [self addShape:rectangle];
    return rectangle;
}


-(void) addShape:(Shape *) shape {
    [self.shapes addObject:shape];
    [self resetTrackingAreas];
    [self setNeedsDisplay:YES];
}


#pragma mark *** Tracking Areas ***

-(void) resetTrackingAreas {
    while (self.trackingAreas.firstObject != nil) {
        [self removeTrackingArea:self.trackingAreas.firstObject];
    }
    for (Shape *shape in self.shapes) {
        [self addTrackingAreaFor:shape];
    }
}

-(void) addTrackingAreaFor:(Shape *) shape {
    NSTrackingArea *trackingArea = [[NSTrackingArea alloc] initWithRect:shape.trackingRect options:(NSTrackingMouseEnteredAndExited | NSTrackingMouseMoved | NSTrackingActiveInKeyWindow ) owner:self userInfo:nil];
    [self addTrackingArea:trackingArea];
}


#pragma mark *** Mouse Movements ***

-(void) mouseEntered:(NSEvent *)theEvent {
    NSPoint point = [self convertPoint: [theEvent locationInWindow] fromView: nil];
    
    Shape *shape = [self findShapeInPoint:point];
    if(shape!= nil) {
        [shape hover:YES];
        self.hoverShape = shape;
        [self setNeedsDisplay:YES];
    }
}

-(void) mouseMoved:(NSEvent *)theEvent {
    
}

-(void) mouseExited:(NSEvent *)theEvent {
    if(self.hoverShape != nil) {
        [self.hoverShape hover:NO];
        self.hoverShape = nil;
        [self setNeedsDisplay:YES];
    }
}

-(void) mouseDown:(NSEvent *)theEvent {
    NSPoint point = [self convertPoint: [theEvent locationInWindow] fromView: nil];
    [self setSelectedShapeFromPoint:point];
    [self setNeedsDisplay:YES];
}

-(void) mouseUp:(NSEvent *)theEvent {
    if(self.draggingSelectedShape == YES) {
        self.draggingSelectedShape = NO;
        [self resetTrackingAreas];
    }
}


-(void) mouseDragged:(NSEvent *)theEvent {
    NSPoint point = [self convertPoint: [theEvent locationInWindow] fromView: nil];
    if(self.selectedShape) {
        self.draggingSelectedShape = YES;
        [self.selectedShape handleMouseDraggedTo:point];
        [self setNeedsDisplay:YES];
    }
}

#pragma mark *** Selections ***

-(void) setSelectedShapeFromPoint: (NSPoint) point {
    [self unsetPreviousSelectedShape];
    Shape *shape = [self findShapeInPoint:point];
    if(shape != nil) {
        [self setSelectedShape:shape];
        [self setSelectedPoint:point];
        [shape setSelectedFromPoint:point];
    }
}

-(Shape *) findShapeInPoint:(NSPoint) point {
    Shape *found = nil;
    for (Shape *shape in self.shapes) {
        if([shape isPointInShape:point]) {
            found = shape;
            break;
        }
    }
    return found;
}

-(void) unsetPreviousSelectedShape {
    [self setSelectedShape:nil];
    for (Shape *shape in self.shapes) {
        [shape unSetSelected];
    }
}

@end

