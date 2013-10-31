//
//  SelectionHandle.h
//  Wireframe6
//
//  Created by Alberto Morales on 10/30/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//
// Location Ids:
// 7----6----5
// |         |
// 8         4
// |         |
// 1----2----3
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface SelectionHandle : NSObject

@property NSPoint point;
@property NSRect rect;
@property int locationId;


+(id) handleAt:(NSPoint) atPoint LocationId: (int) theLocationId;

+ (NSRect) newBoundsFromBounds:(NSRect) old forHandle:(int) whichOne withDelta:(NSPoint) p;

-(id) initWithPoint:(NSPoint) thePoint LocationId:(int) theLocationId;

-(void) draw;

-(BOOL) isPointInside:(NSPoint) point;

-(NSRect) getNewBoundsFromBounds:(NSRect) previousRect withDelta:(NSPoint) newPoint;


@end
