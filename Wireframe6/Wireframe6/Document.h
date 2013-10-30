//
//  Document.h
//  Wireframe6
//
//  Created by Alberto Morales on 10/29/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Drawing.h"
#import "GridView.h"

@interface Document : NSDocument

@property Drawing *drawing;

@property (strong) IBOutlet GridView *gridView;

- (IBAction)lineButtonPressed:(id)sender;

@end
