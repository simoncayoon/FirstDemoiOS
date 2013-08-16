//
//  RecentCtl.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-22.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "RecentCtl.h"
#import "CustomLabel.h"

@interface RecentCtl ()

@end

@implementation RecentCtl

@synthesize joinerList = _joinerList;
@synthesize myHistoryList = _myHistoryList;
@synthesize recentList = _recentList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.view setBackgroundColor:[UIColor colorWithRed:232 green:232 blue:232 alpha:232]];
        
        //初始化会议历史列表
        self.myHistoryList = [[NSMutableArray alloc] initWithCapacity:4];
        self.joinerList = [[NSMutableArray alloc] initWithObjects:@"我", @"张正东", @"陈坤", @"谢冰涵", nil];
        [self.myHistoryList addObject:self.joinerList];
        self.joinerList = [[NSMutableArray alloc] initWithObjects:@"我", @"谢冰涵", @"刘旺", @"梁梅", @"邓开元", @"罗玉林", @"罗茂忠", nil];
        [self.myHistoryList addObject:self.joinerList];
        self.joinerList = [[NSMutableArray alloc] initWithObjects:@"我", @"王菲", @"刘露", @"王明阳", @"朱大鹏", nil];
        [self.myHistoryList addObject:self.joinerList];
        self.joinerList = [[NSMutableArray alloc] initWithObjects:@"13-7-1", @"13-6-15", @"13-5-20", nil];
//        [self.myHistoryList addObject:self.joinerList];
//        NSLog(@"the capacity is :%d", self.myHistoryList.count);
        
        //添加图表
        self.recentList = [[UITableView alloc] initWithFrame:CGRectMake(0, 49, 320, 270)];
        [self.recentList setTableFooterView:[[UIView alloc] init]];
        [self.recentList setDelegate:self];
        [self.recentList setDataSource:self];
        [self.view addSubview:_recentList];
        if(self.myHistoryList.count == 0){
            NSLog(@"no elements in myHistoryList");
        }
        
        CustomLabel *topLabel = [[CustomLabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49) setTitle:@"最近会议"];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.myHistoryList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * nul = [NSString stringWithFormat:@"cell%d",indexPath.row];
    UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:nul];
    Cell.selectionStyle = UITableViewCellSelectionStyleGray;
    if(Cell == nil){
        Cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier: nul];
        Cell.selectionStyle = UITableViewCellSelectionStyleGray;
        UILabel *nameList = [[UILabel alloc] initWithFrame:CGRectMake(7, 15, 150, 20)];
        //数组的字符串拼接
        nameList.text  = [[self.myHistoryList objectAtIndex:[indexPath row]] componentsJoinedByString:@" "];
        UILabel *personCount = [[UILabel alloc] initWithFrame:CGRectMake(160, 15, 40, 20)];
        NSString *_count = [NSString stringWithFormat:@"%d 人", [[self.myHistoryList objectAtIndex:[indexPath row]] count]];
        personCount.text = _count;
        [personCount setTextColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"top.png"]]];
        UILabel *myTime  = [[UILabel alloc] initWithFrame:CGRectMake(230, 15, 60, 20)];
        myTime.text = [self.joinerList objectAtIndex:[indexPath row]];
        
        [Cell.contentView addSubview:nameList];
        [Cell.contentView addSubview:personCount];
        [Cell.contentView addSubview:myTime];
    }
    
    return Cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //弹出对话框
    NSString *downtext = [[self.myHistoryList objectAtIndex:[indexPath row]] componentsJoinedByString:@" "];
    
    
    //年
    NSString *year = [self.joinerList objectAtIndex:[indexPath row]];
    //随机时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    int iRandom = arc4random();
    if (iRandom < 0) {
        iRandom = -iRandom;
    }
    [formatter setDateFormat:@"HH:mm"];
    NSString * randomTime = [NSString stringWithFormat:@"%@",[formatter stringFromDate:[NSDate date]]];
    //人数
    NSString *count = [NSString stringWithFormat:@"%d 人", [[self.myHistoryList objectAtIndex:[indexPath row]] count]];
    NSString *uptext;
    uptext = [NSString stringWithFormat: @"20%@   %@   %@", year, randomTime, count];
    NSLog(@"%@", uptext);
//    CustomAlertView *alertView = [[CustomAlertView alloc] initWithImage:nil contentImage:[UIImage imageNamed:@"zjhybg.png"] upText:uptext downText:downtext];
//    
//    [alertView show];
    TLAlertView * dialogView = [[TLAlertView alloc] initWithImage:nil contentImage:[UIImage imageNamed:@"zjhybg.png"] upText:uptext downText:downtext inView:self.view];
    [dialogView show];
    
    
}

#pragma mark -
#pragma mark the alertview delegate



@end
