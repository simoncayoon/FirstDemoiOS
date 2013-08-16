//
//  UsrInfo.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-29.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "UsrInfo.h"
#import "CustomLabel.h"

@interface UsrInfo ()

@end

@implementation UsrInfo

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        CustomLabel *topLabel = [[CustomLabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49) newStyle:@"用户信息"];
        [topLabel.returnBtn addTarget:self action:@selector(returnPrevious) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:topLabel];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) returnPrevious
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
