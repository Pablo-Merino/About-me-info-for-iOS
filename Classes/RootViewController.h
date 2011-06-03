//
//  RootViewController.h
//  Pablo
//
//  Created by Pablo Merino on 01/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface RootViewController : UITableViewController <MFMailComposeViewControllerDelegate> {
	UILabel *label;
}
- (void)addHeader;
- (void)addFooter;
@end
