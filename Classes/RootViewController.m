//
//  RootViewController.m
//  Pablo
//
//  Created by Pablo Merino on 01/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "SVWebViewController.h"

@implementation RootViewController


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Header and footer
	[self addHeader];
    [self addFooter];
    
}

#pragma mark -
#pragma mark Header code
- (void)addHeader {
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 70)];
	
	label = [[UILabel alloc] initWithFrame:CGRectMake(77, 0, 250, 50)];
	label.text = @"[[zad0xsis alloc] init];";
	label.shadowColor = [UIColor whiteColor];
	label.shadowOffset = CGSizeMake(0.0f, 1.0f);
	label.textColor = [UIColor colorWithRed:(76.0/255.0) green:(86.0/255.0) blue:(108.0/255.0) alpha:1.0f];
	label.backgroundColor = [UIColor clearColor];
	label.font = [UIFont boldSystemFontOfSize:17.0f];
	[header addSubview:label];
	[label release];
	
	label = [[UILabel alloc] initWithFrame:CGRectMake(77, 25, 250, 50)];
	label.text = @"void pabloMerino;";
	label.shadowColor = [UIColor whiteColor];
	label.shadowOffset = CGSizeMake(0.0f, 1.0f);
	label.textColor = [UIColor colorWithRed:(76.0/255.0) green:(86.0/255.0) blue:(108.0/255.0) alpha:1.0f];
	label.backgroundColor = [UIColor clearColor];
	label.font = [UIFont systemFontOfSize:15.0f];
	[header addSubview:label];
	[label release];
	
	UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 57, 57)];
	img.layer.cornerRadius = 5.0;
	img.layer.masksToBounds = YES;
	img.image = [UIImage imageNamed:@"me.jpg"];
	[header addSubview:img];
	[img release];
	
	self.tableView.tableHeaderView = header;
}

#pragma mark -
#pragma mark Footer code
- (void)addFooter {
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
	
	label = [[UILabel alloc] initWithFrame:CGRectMake(148, 15, 250, 30)];
	label.text = @"·";
	label.shadowColor = [UIColor whiteColor];
	label.shadowOffset = CGSizeMake(0.0f, 1.0f);
	label.textColor = [UIColor colorWithRed:(76.0/255.0) green:(86.0/255.0) blue:(108.0/255.0) alpha:1.0f];
	label.backgroundColor = [UIColor clearColor];
	label.font = [UIFont boldSystemFontOfSize:60.0f];
	[footer addSubview:label];
	[label release];
    
    self.tableView.tableFooterView = footer;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    } else if (section == 1) {
        return 1;
    }
    return 0;
}

- (NSString *) tableView:(UITableView *) tableView titleForHeaderInSection:(NSInteger) section
{   
    if (section == 0) {
        return @"Who I am?";
    } else if (section == 1) {
        return @"Facts about me";
    }
    return @"Section unnamed";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

	if (indexPath.section == 0 && indexPath.row == 0) {
		cell.textLabel.text = @"So, if you came here, you should be wondering who I am? I'm a 15 years old Spanish developer who does a lot of shit :P";
		cell.textLabel.font = [UIFont systemFontOfSize:16.0];
		cell.textLabel.numberOfLines = 0;
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		cell.accessoryType = UITableViewCellAccessoryNone;
	} else if (indexPath.section == 0 && indexPath.row == 1) {
		cell.textLabel.text = @" Website";

	} else if (indexPath.section == 0 && indexPath.row == 2) {
		cell.textLabel.text = @" Twitter";

	} else if (indexPath.section == 0 && indexPath.row == 3) {
		cell.textLabel.text = @" Contact";
	} else if (indexPath.section == 1 && indexPath.row == 0) {
		cell.textLabel.text = @"I'm a 15 years teenager who loves hanging out at street, its dog, computers and music. I live on Spain, at a tiny city in the north (Palencia). I usually become bored easily. I don't like giving explanations about what I do. I love developing silly things & utilities for spending my time and don't become bored. I have over 8.000 tweets and over 300 followers. People who follows me knows I'm a great developer.";
		cell.textLabel.font = [UIFont systemFontOfSize:16.0];
		cell.textLabel.numberOfLines = 0;
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		cell.accessoryType = UITableViewCellAccessoryNone;
	}

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 0 && indexPath.row == 0) {
		return 120.0;
	} else if (indexPath.section == 1 && indexPath.row == 0) {
		return 250.0;
	} else {
        return 44.0;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 1) {
		SVWebViewController *webViewController = [[SVWebViewController alloc] initWithAddress:@"http://zad0xsis.net"];
        [self.navigationController pushViewController:webViewController animated:YES];
        [webViewController release];
	} else if (indexPath.section == 0 && indexPath.row == 2) {
        SVWebViewController *webViewController = [[SVWebViewController alloc] initWithAddress:@"http://twitter.com/zad0xsis"];
        [self.navigationController pushViewController:webViewController animated:YES];
        [webViewController release];
	} else if (indexPath.section == 0 && indexPath.row == 3) {
        MFMailComposeViewController *emailComposer = [[MFMailComposeViewController alloc] init]; 

        [emailComposer setMailComposeDelegate: self]; 
        [emailComposer setToRecipients:[NSArray arrayWithObjects:@"pablo.perso1995@gmail.com",nil]];		
        [emailComposer setSubject:@"Hi!"];
		[emailComposer setMessageBody:@"Hi! (insert your text here)" isHTML:NO];
		emailComposer.modalPresentationStyle = UIModalPresentationFormSheet;
		
		[self presentModalViewController:emailComposer animated:YES];
		[emailComposer release];
	}
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


#pragma mark -
#pragma mark MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
	[controller dismissModalViewControllerAnimated:YES];
}
	

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
    [self.tableView release];
    
}


@end

