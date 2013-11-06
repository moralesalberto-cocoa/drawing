//
//  Document.h
//  Wireframe6
//
//  Created by Alberto Morales on 10/29/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "GridView.h"
#import "DrawingView.h"
#import "Shape.h"

@interface Document : NSDocument

@property (strong) IBOutlet GridView *gridView;
@property (strong) IBOutlet DrawingView *drawingView;

@property (strong) NSMutableArray *archivedShapes;

- (IBAction)lineButtonPressed:(id)sender;
- (IBAction)circleButtonPressed:(id)sender;
- (IBAction)rectButtonPressed:(id)sender;
- (IBAction)verticalLineButtonPressed:(id)sender;
- (IBAction)browserButtonPressed:(id)sender;

@end
