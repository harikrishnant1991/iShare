//
//  iShare.h
//  iShare
//
//  Created by Harikrishnan T on 10/07/14.
//  Copyright (c) 2014 FyrWeel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <Social/Social.h>
#import "AppDelegate.h"

@interface iShare : UIActionSheet<UIActionSheetDelegate>
{
  NSString *contentSubject;
  NSString *shareContent;
  UIImage *shareImage;
}

- (void) setShareSubject:(NSString *)subject andContent:(NSString *)content withImage:(UIImage *)image;

@end
