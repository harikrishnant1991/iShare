//
//  iShare.m
//  iShare
//
//  Created by Harikrishnan T on 10/07/14.
//  Copyright (c) 2014 FyrWeel. All rights reserved.
//

#import "iShare.h"

@implementation iShare

-(void)initialize{
    self.title = NSLocalizedString(@"Share Via", Nil);
    self.delegate = self;
    if ([MFMailComposeViewController canSendMail]) {
        [self addButtonWithTitle:NSLocalizedString(@"Email", Nil)];
    }
    if ([MFMessageComposeViewController canSendText]) {
        [self addButtonWithTitle:NSLocalizedString(@"SMS", Nil)];
    }
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        [self addButtonWithTitle:NSLocalizedString(@"Facebook", Nil)];
    }
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        [self addButtonWithTitle:NSLocalizedString(@"Twitter", Nil)];
    }
    self.cancelButtonIndex = [self addButtonWithTitle:NSLocalizedString(@"Cancel", Nil)];
    self.destructiveButtonIndex = 0;
}

-(id)init{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

-(void)composeMail {
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [mailer setSubject:contentSubject];
        NSData *body = [shareContent dataUsingEncoding:NSUTF8StringEncoding];
        NSData *myData = UIImagePNGRepresentation(shareImage);
        [mailer addAttachmentData:myData mimeType:@"image/png" fileName:@"GloboFish.png"];
        NSString *emailBody = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding];
        [mailer setMessageBody:emailBody isHTML:NO];
        AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [appdelegate.window.rootViewController presentViewController:mailer animated:YES completion:nil];
    }
}

-(void)sendSms {
    if([MFMessageComposeViewController canSendText])
    {
        MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
        controller.body = shareContent;
        controller.messageComposeDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [appdelegate.window.rootViewController presentViewController:controller animated:YES completion:nil];
    }
}

- (void) setShareSubject:(NSString *)subject andContent:(NSString *)content withImage:(UIImage *)image {
  shareSubject = subject;
  shareContent = content;
  shareImage = image;
}

- (void)shareToFb {
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *slComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [slComposeViewController setInitialText:shareContent];
        [slComposeViewController addImage:shareImage];
        AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [appdelegate.window.rootViewController presentViewController:slComposeViewController animated:YES completion:nil];
    }
}

- (void)shareToTwitter {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        SLComposeViewController *slComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [slComposeViewController setInitialText:shareContent];
        [slComposeViewController addImage:shareImage];
        VBSAppDelegate *appdelegate = (VBSAppDelegate *)[UIApplication sharedApplication].delegate;
        [appdelegate.window.rootViewController presentViewController:slComposeViewController animated:YES completion:nil];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:NSLocalizedString(@"Email", Nil)]) {
        [self composeMail];
    }
    else if ([buttonTitle isEqualToString:NSLocalizedString(@"SMS", Nil)]) {
        [self sendSms];
    }
    else if ([buttonTitle isEqualToString:NSLocalizedString(@"Facebook", Nil)]) {
        [self shareToFb];
    }
    else if ([buttonTitle isEqualToString:NSLocalizedString(@"Twitter", Nil)]) {
        [self shareToTwitter];
    }
}

@end
