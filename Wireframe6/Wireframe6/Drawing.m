//
//  Drawing.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/29/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "Drawing.h"

@implementation Drawing

-(id) init {
    self = [super init];
    self.elements = [NSMutableArray arrayWithObjects: nil];
    return self;
}

-(Line *) newLine {
    Line * line = [[Line alloc] init];
    [self.elements addObject:line];
    return line;
}


-(void) draw {
    for (Shape *shape in self.elements) {
        [shape draw];
    }
}

-(int) handleMouseDown:(CGPoint) point {
    int redraw = 0;
    
    for (Shape *shape in self.elements) {
        redraw += [shape handleMouseDown: point];
    }
    return redraw;
}

-(int) handleMouseMoved:(CGPoint) point {
    int redraw = 0;
    
    for (Shape *shape in self.elements) {
        redraw += [shape handleMouseMoved: point];
    }
    return redraw;
}

@end
