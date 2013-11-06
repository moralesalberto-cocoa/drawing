//
//  FreeHand.h
//  Wireframe6
//
//  Created by Alberto Morales on 11/6/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FreeHand : NSObject {
    NSPoint _startPoint;
    NSPoint _endPoint;
    NSBezierPath * _bezierPath;
}

extern double const BEZIER_PATH_OFFSET;
extern double const BEZIER_LENGTH_PARTS;

-(id) initWithPath:(NSBezierPath *) thePath Between:(NSPoint) startPoint And: (NSPoint) endPoint;

- (void) setPath;




@end
