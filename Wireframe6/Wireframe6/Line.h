//
//  Line.h
//  Wireframe6
//
//  Created by Alberto Morales on 10/29/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shape.h"

@interface Line : Shape

@property CGPoint startPoint;

@property CGPoint endPoint;


-(void) resetWithStartPoint:(CGPoint) startP andEndPoint:(CGPoint) endP;

-(void) draw;


@end