//
//  Grid.h
//  Wireframe6
//
//  Created by Alberto Morales on 10/29/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Grid : NSObject

@property CGRect frame;
@property NSBezierPath * bezierPath;
@property double increment;
@property CGPoint startPoint;
@property CGPoint endPoint;



-(id) initWithFrame:(CGRect) frame;

-(void) drawGrid;

@end
