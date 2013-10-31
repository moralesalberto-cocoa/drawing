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
@property BOOL affectsStartPoint;
@property BOOL affectsEndPoint;

+(id) handleAt:(CGPoint) atPoint AllowXChange: (BOOL) allowX AllowYChange: (BOOL) allowY AffectsStartPoint:(BOOL) affectsStartP AffectsEndPoint: (BOOL) affectsEndP;


-(id) initWithPoint:(CGPoint) thePoint AllowXChange:(BOOL) allowX AllowYChange:(BOOL) allowY AffectsStartP:(BOOL) affectsStartP AffectsEndPoint: (BOOL) affectsEndP;

-(void) draw;

-(CGPoint) getNewStartPointFor:(CGPoint)startPoint ShapeDraggedTo:(CGPoint) endDragPoint;

-(CGPoint) getNewEndPointFor:(CGPoint)endPoint ShapeDraggedTo:(CGPoint) endDragPoint;


@end
