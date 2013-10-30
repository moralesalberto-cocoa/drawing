//
//  GridView.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/29/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "GridView.h"

@implementation GridView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        [self.window setAcceptsMouseMovedEvents:YES];
        
        NSTrackingArea *trackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds options:(NSTrackingActiveInKeyWindow | NSTrackingMouseMoved | NSTrackingInVisibleRect) owner:self userInfo:nil];
        
        [self addTrackingArea:trackingArea];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
    
    [[[Grid alloc]initWithFrame:dirtyRect] drawGrid];
    
    [self.drawing draw];
}


- (void)mouseDown:(NSEvent *)theEvent {
    int redraw = 0;
    NSPoint point = [self convertPoint:[theEvent locationInWindow] fromView:nil];
    redraw += [self.drawing handleMouseDown: point];
    if(redraw > 0) {
        [self setNeedsDisplay:YES];
    }
    else {
        [[self nextResponder] mouseDown:theEvent];
    }
}

-(void) newShapeAdded:(Shape *) shape {
    [self setNeedsDisplay:YES];
}


-(void) mouseMoved:(NSEvent *)theEvent{
    
    int redraw = 0;
    NSPoint point = [self convertPoint:[theEvent locationInWindow] fromView:nil];
    redraw += [self.drawing handleMouseMoved: point];
    if(redraw > 0) {
        [self setNeedsDisplay:YES];
    }
    else {
        [[self nextResponder] mouseDown:theEvent];
    }
    
}


@end
