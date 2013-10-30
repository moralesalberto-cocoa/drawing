//
//  Line.h
//  Wireframe6
//
//  Created by Alberto Morales on 10/29/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shape.h"

@interface Line : Shape <NSCoding>




-(void) resetWithStartPoint:(CGPoint) startP andEndPoint:(CGPoint) endP;

-(void) draw;

-(void) resetTrackingRect; // to be implemented by the child class and called in init method;

-(id) init; // to be implemented by the child class, and call resetWithStartPoint:EndPoint;

@end
