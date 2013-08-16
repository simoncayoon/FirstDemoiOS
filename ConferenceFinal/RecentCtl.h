//
//  RecentCtl.h
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-22.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomAlertView.h"
#import "TLAlertView.h"

@interface RecentCtl : UIViewController<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>
{
    NSMutableArray* _myHistoryList;
    NSMutableArray* _joinerList;
    UITableView* _recentList;
}
@property(nonatomic, retain) NSMutableArray* joinerList;
@property(nonatomic, retain) NSMutableArray* myHistoryList;
@property(nonatomic, retain) UITableView* recentList;

//cell object

@end
