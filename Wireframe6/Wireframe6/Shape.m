//
//  Shape.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/29/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "Shape.h"

@implementation Shape

-(id) init {
    self = [super init];
    self.bezierPath = [NSBezierPath bezierPath];
    self.color = [NSColor blackColor];
    return self;
}

-(void) draw {
    
    [self.color set];
    
}


@end
