//
//  CallBookCtl.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-22.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "CallBookCtl.h"
#import "CustomCell.h"
#import "CustomLabel.h"

@interface CallBookCtl ()

@end

@implementation CallBookCtl
@synthesize delegate = _delegate;
@synthesize listDataSource = _listDataSource;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.selState = NO;
        // Custom initialization
        [self.view setBackgroundColor:[UIColor colorWithRed:232 green:232 blue:232 alpha:232]];
        [self.serchEdit setPlaceholder:@"搜索联系人"];
        
        //导航标签
        CustomLabel *topLabel = [[CustomLabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49) setTitle:@"通讯录"];
        [self.view addSubview:topLabel];
        
        //绘制列表
        _callList = [[ContactListViewController alloc] init];
        [_callList.tableView setFrame:CGRectMake(0, 104, 320, 280)];
        [self.view addSubview:_callList.tableView];
        
        //delegate
        _callList.cancelAllSelect = self;
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

- (IBAction)selectAllOrNot:(id)sender {
    
    if(_selState == NO){
        [self setBtnBgdImage:_selState];
    }else{
        [self setBtnBgdImage:_selState];
    }
    [_callList selectAll:!_selState count:_callList.nameContent.count];
     _selState = !_selState;
}

- (IBAction)addToConfRoom:(id)sender {
    
    if([_delegate respondsToSelector:@selector(showFromCallBook:)]){
        self.mySelectedData = [_callList dataFilter];
        [_delegate showFromCallBook:self.mySelectedData];
    }
}

- (IBAction)hideKeyboard:(id)sender {
    [sender resignFirstResponder];
}

- (void) cancelSelected{
    [self setBtnBgdImage:YES];
    _selState = NO;
}

- (void) selectAll{
    [self setBtnBgdImage:NO];
    _selState = YES;
}

-(void) setBtnBgdImage:(BOOL)state{
    if(NO == state){
        [self.checkBtn setImage:[UIImage imageNamed:@"goux_click.png"] forState:UIControlStateNormal];
    }else{
        [self.checkBtn setImage:[UIImage imageNamed:@"goux_default.png"] forState:UIControlStateNormal];
    }
}

@end
