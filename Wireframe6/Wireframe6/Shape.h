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

@property BOOL isSelected;

@property NSMutableArray *handles;

@property SelectionHandle *selectedHandle;

@property BOOL isHandleSelected;


// most shapes can use these
@property CGPoint startPoint;

@property CGPoint endPoint;


+(NSColor *) highlightColor;

-(void) draw;

-(void) drawHandles;

-(void) resetHandles;

-(void) resetWithStartPoint:(CGPoint) startP andEndPoint:(CGPoint) endP;
-(void) adjustStartAndEndPointWith:(CGPoint) pointOne And: (CGPoint) pointTwo;

-(void) doBezierPath;

-(void) resetTrackingRect;

-(void) handleMouseDraggedTo:(CGPoint) endP;

-(void) changeDimensionsDraggedTo: (CGPoint) endP;

-(BOOL) isPointInShape:(CGPoint) point;

-(void) setSelectedFromPoint:(CGPoint) point;

-(void) unSetSelected;


-(void) hover:(BOOL) doHover;




@end
