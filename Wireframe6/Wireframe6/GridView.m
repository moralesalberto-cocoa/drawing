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
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
    
    [[[Grid alloc]initWithFrame:dirtyRect] drawGrid];
    
    [self.drawing draw];
}

-(BOOL)acceptsFirstMouse:(NSEvent *)theEvent {
    
    return YES;
}


- (void)mouseDown:(NSEvent *)theEvent {
    // determine if I handle theEvent
    // if not...
    
    NSLog(@"%@", self.drawing.elements.firstObject);
    
    NSPoint eyeCenter = [self convertPoint:[theEvent locationInWindow] fromView:nil];
    
    NSLog(@"x:%f, y:%f", eyeCenter.x, eyeCenter.y);
    
    for (Shape *shape in self.drawing.elements) {
        if(NSPointInRect(eyeCenter, shape.trackingRect)){
            NSLog(@"SUCCESS!!! GO REST");
            [shape setColor:[NSColor redColor]];
            [self setNeedsDisplay:YES];
        }
    }
    
    
    [[self nextResponder] mouseDown:theEvent];
}


@end
