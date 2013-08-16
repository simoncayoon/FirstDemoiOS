//
//  PasswrdConfig.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-29.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "PasswrdConfig.h"
#import "CustomLabel.h"

@interface PasswrdConfig ()

@end

@implementation PasswrdConfig

@synthesize oldpassEdit;
@synthesize newpassEdit;
@synthesize passConfirm;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        CustomLabel *topLabel = [[CustomLabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49) newStyle:@"修改密码"];
        [topLabel.returnBtn addTarget:self action:@selector(returnPrevious) forControlEvents:UIControlEventTouchUpInside];        
        [self.view addSubview:topLabel];
        
        [oldpassEdit setPlaceholder:@"请输入旧密码"];
        [newpassEdit setPlaceholder:@"请输入新密码"];
        [passConfirm setPlaceholder:@"请再次输入新密码"];
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
