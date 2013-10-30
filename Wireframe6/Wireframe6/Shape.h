//
//  Shape.h
//  Wireframe6
//
//  Created by Alberto Morales on 10/29/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shape : NSObject

@property NSBezierPath *bezierPath;

@property NSColor *color;

@property CGRect trackingRect;


-(void) draw;




@end
