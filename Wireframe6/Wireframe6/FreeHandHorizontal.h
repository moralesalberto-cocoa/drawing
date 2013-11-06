//
//  FreeHandHorizontal.h
//  Wireframe6
//
//  Created by Alberto Morales on 11/6/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FreeHand.h"

@interface FreeHandHorizontal : FreeHand

+(void) setPathFor: (NSBezierPath *) thePath Between:(NSPoint) startPoint And: (NSPoint) endPoint;

@end
