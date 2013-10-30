//
//  DrawingView.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/30/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.shapes = [NSMutableArray arrayWithObjects: nil];
        self.draggingSelectedShape = NO;
        self.selectedShape = nil;
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    for (Shape *shape in self.shapes) {
        [shape draw];
    }
}

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


-(void) resetTrackingAreas {
    while (self.trackingAreas.firstObject != nil) {
        [self removeTrackingArea:self.trackingAreas.firstObject];
    }
    for (Shape *shape in self.shapes) {
        NSTrackingArea *trackingArea = [[NSTrackingArea alloc] initWithRect:shape.trackingRect options:(NSTrackingMouseEnteredAndExited | NSTrackingMouseMoved | NSTrackingActiveInKeyWindow ) owner:self userInfo:nil];
        [self addTrackingArea:trackingArea];
    }
}


-(void) mouseEntered:(NSEvent *)theEvent {
    [[NSCursor openHandCursor] set];
}

-(void) mouseMoved:(NSEvent *)theEvent {
    [[NSCursor openHandCursor] set];
}

-(void) mouseExited:(NSEvent *)theEvent {
    [[NSCursor arrowCursor] set];
}

-(void) mouseDown:(NSEvent *)theEvent {
    [[NSCursor closedHandCursor] set];
    NSPoint point = [self convertPoint: [theEvent locationInWindow] fromView: nil];
    [self findSelectedShape:point];
}

-(void) mouseUp:(NSEvent *)theEvent {
    [[NSCursor arrowCursor] set];
    if(self.selectedShape && self.draggingSelectedShape) {
        
        NSPoint point = [self convertPoint: [theEvent locationInWindow] fromView: nil];
        [self.selectedShape draggedFromPoint:self.selectedPoint ToPoint:point];
        [self setNeedsDisplay:YES];
        
        [self resetTrackingAreas];
        [self stopMove];
    }
}


-(void) stopMove {
    self.selectedShape = nil;
    self.draggingSelectedShape = NO;
}

-(void) mouseDragged:(NSEvent *)theEvent {
    if(self.selectedShape) {
        self.draggingSelectedShape = YES;
        [[NSCursor closedHandCursor] set];

    }
}

-(void) findSelectedShape: (NSPoint) point {
    [self setSelectedShape:nil];
    for (Shape *shape in self.shapes) {
        if(NSPointInRect(point, shape.trackingRect)) {
            [self setSelectedShape:shape];
            [self setSelectedPoint:point];
            break;
        }
    }
}

@end

