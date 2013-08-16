//
//  testctlViewController.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-26.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "testctlViewController.h"

@interface testctlViewController ()

@end

@implementation testctlViewController
@synthesize table = _table;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
        [self.view addSubview:_table];
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

@end
