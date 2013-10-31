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

@property NSRect trackingRect;

@property BOOL isSelected;

@property NSMutableArray *handles;

@property SelectionHandle *selectedHandle;

@property NSPoint startPoint;

@property NSPoint endPoint;

@property NSPoint anchorPoint; // used during dragging, resizing


+(NSColor *) highlightColor;
+(NSColor *) defaultColor;

-(void) draw;

-(void) drawHandles;

-(void) resetHandles;

-(void) resetWithStartPoint:(NSPoint) startP andEndPoint:(NSPoint) endP;

-(void) changeDimensionsDraggedTo: (NSPoint) endP;

-(void) doBezierPath;

-(void) resetTrackingRect;

-(void) handleMouseDraggedTo:(NSPoint) endP;

-(void) hover:(BOOL) doHover;

-(BOOL) isPointInShape:(NSPoint) point;

-(void) setSelectedFromPoint:(NSPoint) point;

-(void) unSetSelected;







@end
