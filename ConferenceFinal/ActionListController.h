//
//  ActionListController.h
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-25.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionListController : UITableViewController
{
    NSMutableArray *_arrayRow;
    NSMutableDictionary *_imgDic, *_dataDic;
    UITableView *_actionList;
    NSString* _phoneNum;
}

@property(nonatomic, retain) NSMutableDictionary *imgDic;
@property(nonatomic, retain) NSMutableDictionary *dataDic;
@property(atomic, retain) NSMutableArray *arrayRow;
@property(nonatomic, retain) UITableView *actionList;
@property(nonatomic, retain) NSString* phoneNum;
@property(atomic) BOOL action;

-(void) addCell;

@end
