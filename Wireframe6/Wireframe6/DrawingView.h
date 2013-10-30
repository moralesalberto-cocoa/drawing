//
//  DrawingView.h
//  Wireframe6
//
//  Created by Alberto Morales on 10/30/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Line.h"

@interface DrawingView : NSView <NSCoding>

@property NSMutableArray * shapes;

@property Shape * selectedShape;

@property BOOL draggingSelectedShape;

@property NSPoint selectedPoint;


-(Line *) newLine;

-(id) initWithCoder:(NSCoder *)aDecoder;

-(void) encodeWithCoder:(NSCoder *)aCoder;

-(void) resetTrackingAreas;

@end
