//
//  Shape.h
//  Wireframe6
//
//  Created by Alberto Morales on 10/29/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "SelectionHandle.h"

@interface Shape : NSObject <NSCoding>

@property NSBezierPath *bezierPath;

@property NSColor *color;

@property CGRect trackingRect;

@property BOOL selected;

@property NSMutableArray *handles;


// most shapes can use these
@property CGPoint startPoint;

@property CGPoint endPoint;


+(NSColor *) highlightColor;

-(void) draw;

-(void) drawHandles;

-(void) resetHandles;

-(void) resetWithStartPoint:(CGPoint) startP andEndPoint:(CGPoint) endP;

-(void) resetTrackingRect;

@end
