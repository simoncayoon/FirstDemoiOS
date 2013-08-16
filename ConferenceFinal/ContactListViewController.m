//
//  ContactListViewController.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-28.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "ContactListViewController.h"
#import "CallBookCtl.h"

@interface ContactListViewController ()

@end

@implementation ContactListViewController

@synthesize numContent = _numContent;
@synthesize nameContent = _nameContent;
@synthesize myData = _myData;
@synthesize cellDataSource = _cellDataSource;
@synthesize cell, cancelAllSelect;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.tableView.tableFooterView = [[UIView alloc] init];
//        _nameContent = [[NSMutableArray alloc] initWithObjects:@"王阳明", @"罗玉林", @"谢冰涵", @"陈坤", @"罗茂忠", @"张正东", @"梁梅", @"刘旺", nil];
//        _numContent = [[NSMutableArray alloc] initWithObjects:@"13689082923", @"13511913873", @"15180832509", @"13608513145", @"13885151693", @"18286032208", @"15186967625", @"15329106471", nil];
        
        _nameContent = [[NSMutableArray alloc] initWithObjects:@"王阳明", @"罗玉林", @"谢冰涵", @"陈坤", @"罗茂忠", @"张正东", nil];
        _numContent = [[NSMutableArray alloc] initWithObjects:@"13689082923", @"13511913873", @"15180832509", @"13608513145", @"13885151693", @"18286032208", nil];
        
        self.cellDataSource  = [[NSMutableArray alloc] init];
        [self.cell setSelectState:YES];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
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
    return self.nameContent.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Configure the cell...
    if(self.cellDataSource.count < 6)
        [self.cellDataSource addObject:indexPath];
    NSString* CellIdentifier = [NSString stringWithFormat:@"Cell%d%d",[indexPath section], [indexPath row]];
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[CustomCell alloc] initForContractList:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.usrName.text = [_nameContent objectAtIndex:[indexPath row]];
        cell.usrNum.text = [_numContent objectAtIndex:[indexPath row]];
    }
    cell.tag = [indexPath row];

    NSLog(@"%d", _cellDataSource.count);
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    CustomCell * Cell = (CustomCell*)[self.tableView cellForRowAtIndexPath:indexPath];
    [Cell setSelectState:(!Cell.checkState)];
    [self cancelAllSelected];
}

-(void) selectAll:(BOOL)state count:(NSInteger)count{
    
    for(int i=0;i<self.cellDataSource.count; i++){
        NSIndexPath* indexPath = [self.cellDataSource objectAtIndex:i];
        CustomCell* myAllCell = (CustomCell*)[self.tableView cellForRowAtIndexPath:indexPath];
        [myAllCell setSelectState:state];
        NSLog(@"the i value is:%d", i);
        if(i > _nameContent.count)
            return;
    }
    
}


-(NSMutableDictionary*) dataFilter{
    
    NSMutableArray* namelist = [[NSMutableArray alloc] init];
    NSMutableArray* numlist = [[NSMutableArray alloc] init];
    NSMutableDictionary *dataList = [[NSMutableDictionary alloc] init];
    for(int i = 0; i < self.cellDataSource.count; i++){
        NSIndexPath* indexPath = [self.cellDataSource objectAtIndex:i];
        CustomCell* myAllCell = (CustomCell*)[self.tableView cellForRowAtIndexPath:indexPath];
        if([myAllCell getCheckState] == YES){
            [namelist addObject:myAllCell.usrName.text];
            [numlist addObject:myAllCell.usrNum.text];
        }
    }
    [dataList setObject:namelist forKey:@"namelist"];
    [dataList setObject:numlist forKey:@"numlist"];
    return dataList;
}

//全选按钮 按列表操作变化
- (void)cancelAllSelected{
    if ([[[self dataFilter] objectForKey:@"namelist"] count]< 6) {
        [cancelAllSelect cancelSelected];
    }else{
        [cancelAllSelect selectAll];
        NSLog(@"xxxxxxxxxxxxxxx");
    }
}

@end
