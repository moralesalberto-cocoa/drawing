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
    self.selected = NO;
    self.bezierPath = [NSBezierPath bezierPath];
    self.color = [NSColor blackColor];
    self.handles = [[NSMutableArray alloc] init];
    return self;
}

-(void) draw {
    [self.color set];
    if (self.selected == YES) {
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

-(void) resetTrackingRect {
    NSLog(@"TO BE IMPLEMENTED BY CHILD CLASS");
}


-(void) resetWithStartPoint:(CGPoint) startP andEndPoint:(CGPoint) endP {
    NSLog(@"TO BE IMPLEMENTED BY CHILD CLASS");
}


// Encoding and reading
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

-(void) resetHandles {
    NSLog(@"TO BE IMPLEMENTED BY CHILD CLASS");
}


@end
