//
//  AppDelegate.h
//  AppDelegate
//
//  Created by Harikrishnan T on 10/07/14.
//  Copyright (c) 2014 FyrWeel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <Social/Social.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
