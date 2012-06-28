//
//  MenuViewController.h
//  Catalogo1.0
//
//  Created by Ricardo Sampayo on 27/06/12.
//  Copyright (c) 2012 ucab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) IBOutlet UITableView *rearTableView;

@end
