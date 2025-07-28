//
//  ViewController.m
//  macPEAS
//
//  Created by bwt on 7/27/25.
//

#import "ViewController.h"
#import "SystemInfoCollector.h"
#import "MPCSystemInfo.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray<NSString *> *sidebarItems;
@property (nonatomic, strong) MPCSystemInfo *systemInfo;
@property (nonatomic, strong) NSArray<NSString *> *systemInfoKeys;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.sidebarItems = @[@"System Info", @"Users & Groups", @"Network Info", @"Software Info", @"Permissions", @"Startup Items"];
    self.sidebar.dataSource = self;
    self.sidebar.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    SystemInfoCollector *collector = [[SystemInfoCollector alloc] init];
    self.systemInfo = [collector collectSystemInfo];
    self.systemInfoKeys = @[@"osVersion", @"kernelVersion", @"hostname", @"uptime", @"cpuInfo", @"sipStatus", @"gatekeeperStatus", @"xprotectVersion"];
    [self.tableView reloadData];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

#pragma mark - NSOutlineViewDataSource

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
    return self.sidebarItems.count;
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item {
    return self.sidebarItems[index];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    return NO;
}

#pragma mark - NSOutlineViewDelegate

- (NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item {
    NSTableCellView *cell = [outlineView makeViewWithIdentifier:@"DataCell" owner:self];
    cell.textField.stringValue = item;
    return cell;
}

- (void)outlineViewSelectionDidChange:(NSNotification *)notification {
    // For now, we only have one section, so we don't need to do anything here.
    // In the future, we will use the selected item to determine what data to display.
}

#pragma mark - NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.systemInfoKeys.count;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *key = self.systemInfoKeys[row];
    if ([tableColumn.identifier isEqualToString:@"Property"]) {
        return key;
    } else if ([tableColumn.identifier isEqualToString:@"Value"]) {
        return [self.systemInfo valueForKey:key];
    }
    return nil;
}

@end
