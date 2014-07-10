//
//  ViewController.m
//  iShare
//
//  Created by Harikrishnan T on 10/07/14.
//  Copyright (c) 2014 FyrWeel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self share];
}

- (void)share {
    iShare *share = [[iShare alloc]init];
    [share setShareSubject:@"Subject" andContent:@"Body" withImage:nil];
    [share showInView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
