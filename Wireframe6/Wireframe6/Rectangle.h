//
//  Rectangle.h
//  Wireframe6
//
//  Created by Alberto Morales on 10/30/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shape.h"

@interface Rectangle : Shape <NSCoding>

@property NSPoint startPoint;

@property NSPoint endPoint;

@end
