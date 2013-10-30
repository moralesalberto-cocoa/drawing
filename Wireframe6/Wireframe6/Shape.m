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

-(id) init {
    self = [super init];
    self.bezierPath = [NSBezierPath bezierPath];
    self.color = [NSColor blackColor];
    return self;
}

-(void) draw {
    [self.color set];
    // the rest of the method is implemented in the child class
}

-(void) draggedFromPoint:(NSPoint) from ToPoint:(NSPoint) to {
    // to be implemented by the child class
    
    NSLog(@"NOT SUPPOSED TO BE HERE");
}

@end
