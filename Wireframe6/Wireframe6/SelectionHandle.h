//
//  SelectionHandle.h
//  Wireframe6
//
//  Created by Alberto Morales on 10/30/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface SelectionHandle : NSObject

@property CGPoint point;
@property CGRect rect;

@property BOOL allowXChange;
@property BOOL allowYChange;

-(id) initWithPoint:(CGPoint) thePoint AllowXChange:(BOOL) allowX AllowYChange: (BOOL) allowY;

-(void) draw;


@end
