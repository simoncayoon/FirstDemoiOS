//
//  ActionListController.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-25.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "ActionListController.h"
#import "CustomCell.h"

#define CUSTOM 1

@interface ActionListController ()

@end

@implementation ActionListController

@synthesize arrayRow = _arrayRow;
@synthesize imgDic = _imgDic;
@synthesize dataDic = _dataDic;
@synthesize actionList = _actionList;
@synthesize action;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization    arrayRow = [[NSMutableArray alloc] init ];
        _imgDic = [[NSMutableDictionary alloc] init];
        _dataDic = [[NSMutableDictionary alloc] init];
        _arrayRow = [[NSMutableArray alloc] init];
        if(_arrayRow != nil){
            NSLog(@"the arrayrow is not empty");
        }
        _dataDic = nil;
        
        //init image resource
        _imgDic = [NSMutableDictionary dictionaryWithCapacity:10];
        [_imgDic setObject:[UIImage imageNamed:@"toux2.png"] forKey:@"DefaultHeadPro"];
        [_imgDic setObject:[UIImage imageNamed:@"toux2A.png"] forKey:@"ActionHeadPro"];
        [_imgDic setObject:[UIImage imageNamed:@"icon_bc.png"] forKey:@"HoldingState"];
        [_imgDic setObject:[UIImage imageNamed:@"icon_wbc.png"] forKey:@"HangupState"];
        [_imgDic setObject:[UIImage imageNamed:@"del_click.png"] forKey:@"DeleteState"];
        [_imgDic setObject:[UIImage imageNamed:@"icon2a.png"] forKey:@"AuditState"];
        self.tableView.delegate = self;
        self.tableView.tableFooterView = [[UIView alloc]init];
        action = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.arrayRow count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    NSString * nul = [NSString stringWithFormat:@"cell%d",indexPath.row];

    CustomCell *cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nul];
    cell.selectionStyle = UITableViewCellSelectionStyleGray; 
    if(self.dataDic != nil){
        [cell.usrName setText:[[self.dataDic objectForKey:@"namelist"] objectAtIndex:[indexPath row]]];
    }else{
        [cell.usrName setText:@"无姓名"];
    }
    [cell.usrNum setText:[_arrayRow objectAtIndex:[indexPath row]]];
    [cell.headPortrait setImage:[_imgDic objectForKey:@"DefaultHeadPro"]];
    if(YES == action){
        [cell.headPortrait setImage:[_imgDic objectForKey:@"ActionHeadPro"]];
        [cell.holdingState setImage:[_imgDic objectForKey:@"HoldingState"]];
        [cell.hangUpState setImage:[UIImage imageNamed:@"icon1a.png"] forState:UIControlStateNormal];
        [cell.lsnOrDelState setImage:[_imgDic objectForKey:@"AuditState"] forState:UIControlStateNormal];
    }
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = (CustomCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    [cell.lsnOrDelState setBackgroundImage:[_imgDic objectForKey:@"DeleteState"] forState:UIControlStateNormal];
}


-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0;
}

//添加号码
- (void) addCell{
    for (int i=0; i<_arrayRow.count; i++) {
        NSLog(@"the obj of index %d is :%@", i, [_arrayRow objectAtIndex:i]);
    }
    /******在这里添加号码********，
    *当由按钮添加号码的时候
    *将姓名自动填充为“无姓名”
    **/
    [[self.dataDic objectForKey:@"namelist"] addObject:@"无姓名"];
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:[_arrayRow count] -1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end
