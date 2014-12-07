//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Justin Wong on 25/11/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemsViewController ()

@property (nonatomic, strong) IBOutlet UIView *headerView;

@end

@implementation BNRItemsViewController

- (instancetype)init
{
    // Call the superclass's designated initialiser
    // Make all instsances of `BNRItemsViewController` use the "plain" style
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    // Register the `UITableViewCell` class with the table view, so that
    // it knows which class to create for this reuseIdentifier
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Create an instance of UITableViewCell, with default appearance
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];
    
    // Set the text on the cell with the description of the `BNRItem`
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *item = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    
    return cell;
}

- (IBAction)toggleEditMode:(id)sender
{
    if (self.isEditing) {
        // Change the text of the button to inform the user of state
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        // Turn off editing mode
        [self setEditing:NO animated:YES];
        
    } else {
        // Change the text of the button to inform the user of state
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}

- (IBAction)addNewItem:(id)sender
{
    // Create a new BNRItem and add it to the store
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];
    
    // Figure out where that item is in the array
    NSInteger lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    // Insert this new row into the table
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

- (UIView *)headerView
{
    // If you have not loaded the headerView yet...
    if (!_headerView) {
        // Load the HeaderView.xib
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    return _headerView;
}
@end
