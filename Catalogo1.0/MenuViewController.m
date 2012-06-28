//
//  MenuViewController.m
//  Catalogo1.0
//
//  Created by Ricardo Sampayo on 27/06/12.
//  Copyright (c) 2012 ucab. All rights reserved.
//

#import "MenuViewController.h"
#import "ViewController.h"
#import "FrontViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController
@synthesize rearTableView = _rearTableView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark Data source TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	
	if (nil == cell)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
	}
	
	if (indexPath.row == 0)
	{
		cell.textLabel.text = @"Front View Controller";
	}
	else if (indexPath.row == 1)
	{
		cell.textLabel.text = @"Map View Controller";
	}
	else if (indexPath.row == 2)
	{
		cell.textLabel.text = @"Enter Presentation Mode";
	}
	else if (indexPath.row == 3)
	{
		cell.textLabel.text = @"Resign Presentation Mode";
	}
	
	return cell;
}

#pragma mark TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Grab a handle to the reveal controller, as if you'd do with a navigtion controller via self.navigationController.
	ViewController *revealController = [self.parentViewController isKindOfClass:[ViewController class]] ? (ViewController *)self.parentViewController : nil;
    
	// Here you'd implement some of your own logic... I simply take for granted that the first row (=0) corresponds to the "FrontViewController".
	if (indexPath.row == 0)
	{
		// Now let's see if we're not attempting to swap the current frontViewController for a new instance of ITSELF, which'd be highly redundant.
		if ([revealController.frontViewController isKindOfClass:[UINavigationController class]] && ![((UINavigationController *)revealController.frontViewController).topViewController isKindOfClass:[FrontViewController class]])
		{
			FrontViewController *frontViewController = [[FrontViewController alloc] init];
			UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
			[revealController setFrontViewController:navigationController animated:NO];
			
		}
		// Seems the user attempts to 'switch' to exactly the same controller he came from!
		else
		{
			[revealController revealToggle:self];
		}
	}
	// ... and the second row (=1) corresponds to the "MapViewController".
	else if (indexPath.row == 1)
	{
		// Now let's see if we're not attempting to swap the current frontViewController for a new instance of ITSELF, which'd be highly redundant.
        //push
//		if ([revealController.frontViewController isKindOfClass:[UINavigationController class]] && ![((UINavigationController *)revealController.frontViewController).topViewController isKindOfClass:[MapViewController class]])
//		{
//			MapViewController *mapViewController = [[MapViewController alloc] init];
//			UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mapViewController];
//			[revealController setFrontViewController:navigationController animated:NO];
//		}
//		// Seems the user attempts to 'switch' to exactly the same controller he came from!
//		else
//		{
//			[revealController revealToggle:self];
//		}
	}
	else if (indexPath.row == 2)
	{
		[revealController hideFrontView];
	}
	else if (indexPath.row == 3)
	{
		[revealController showFrontViewCompletely:NO];
	}
}



@end
