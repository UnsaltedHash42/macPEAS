//
//  ViewController.h
//  macPEAS
//
//  Created by bwt on 7/27/25.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController <NSOutlineViewDataSource, NSOutlineViewDelegate, NSTableViewDataSource, NSTableViewDelegate>

@property (weak) IBOutlet NSOutlineView *sidebar;
@property (weak) IBOutlet NSTableView *tableView;

@end

