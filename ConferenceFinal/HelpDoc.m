//
//  HelpDoc.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-8-8.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "HelpDoc.h"
#import "CustomLabel.h"
#import "MoreCtl.h"

@interface HelpDoc ()

@end

@implementation HelpDoc
@synthesize moreCtl = _moreCtl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        CustomLabel *topLabel = [[CustomLabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49) newStyle:@"帮助说明"];
        [topLabel.saveBtn setHidden:YES];
        [topLabel.returnBtn addTarget:self action:@selector(dismissAction) forControlEvents:UIControlEventTouchUpInside];
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

-(void) dismissAction{
    [self dismissViewControllerAnimated:NO completion:^{
        [self.moreCtl.hideBtnDelegate recoverBtn];
    }];
    [self.moreCtl.hideBtnDelegate recoverBtn];
}

@end
