//
//  Document.m
//  Wireframe6
//
//  Created by Alberto Morales on 10/29/13.
//  Copyright (c) 2013 Alberto Morales. All rights reserved.
//

#import "Document.h"

@implementation Document

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        
        self.archivedShapes = [NSMutableArray arrayWithObjects: nil];
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
    
    [self.drawingView.shapes addObjectsFromArray:self.archivedShapes];
    [self.drawingView resetTrackingAreas];
    [self.drawingView setNeedsDisplay:YES];
    
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to write your document to data
    if(outError) {
        *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
    }
    self.archivedShapes = [NSMutableArray arrayWithArray: self.drawingView.shapes];
    return [NSKeyedArchiver archivedDataWithRootObject:self.archivedShapes];
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to read your document from the given data of the specified type.
    if(outError) {
        *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
    }
    
    [self setArchivedShapes:[NSKeyedUnarchiver unarchiveObjectWithData:data]];
    return YES;
}

- (IBAction)lineButtonPressed:(id)sender {
    [self.drawingView newLine];
}
@end
