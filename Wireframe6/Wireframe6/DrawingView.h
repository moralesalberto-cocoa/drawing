//
//  DrawingView.h
//  Wireframe6
//
//  Created by Alberto Morales on 10/30/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "HorizontalLine.h"
#import "VerticalLine.h"
#import "Circle.h"
#import "Rectangle.h"
#import "BrowserShape.h"

@interface DrawingView : NSView

@property NSMutableArray * shapes;

@property Shape *selectedShape;

@property BOOL draggingSelectedShape;

@property NSPoint selectedPoint;

@property Shape *hoverShape;


-(HorizontalLine *) newHorizontalLine;
-(VerticalLine *) newVerticalLine;
-(Circle *) newCircle;
-(Rectangle *) newRectangle;
-(BrowserShape *) newBrowserShape;

-(void) resetTrackingAreas;

-(void) setSelectedShapeFromPoint:(NSPoint) point;

@end
