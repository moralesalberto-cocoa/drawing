//
//  Circle.h
//  Wireframe6
//
//  Created by Alberto Morales on 10/30/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shape.h"

@interface Circle : Shape <NSCoding>

@property CGPoint startPoint;

@property CGPoint endPoint;


-(void) resetWithStartPoint:(CGPoint) startP andEndPoint:(CGPoint) endP;

-(void) draw;


@end
