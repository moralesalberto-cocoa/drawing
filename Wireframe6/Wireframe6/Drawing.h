//
//  Drawing.h
//  Wireframe6
//
//  Created by Alberto Morales on 10/29/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Line.h"


@interface Drawing : NSObject

@property NSMutableArray * elements;

-(Line *) newLine;

-(void) draw;

-(int) handleMouseDown:(CGPoint) point;

-(int) handleMouseMoved:(CGPoint) point;

@end
