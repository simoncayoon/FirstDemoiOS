//
//  ContactListViewController.h
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-28.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"

@class CallBookCtl;

@protocol cancelSelectAll <NSObject>

-(void) cancelSelected;
-(void) selectAll;

@end

@interface ContactListViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray* _nameContent;
    NSMutableArray* _numContent;
    NSDictionary* _myData;
    NSMutableArray* _cellDataSource;
    
}

@property (nonatomic, retain) CustomCell *cell;
@property(nonatomic, retain) NSMutableArray* numContent;
@property(nonatomic, retain) NSMutableArray* nameContent;
@property(nonatomic, retain) UIButton* selectBtn;
@property(nonatomic, retain) NSDictionary* myData;
@property(atomic) NSMutableArray* cellDataSource;
@property(nonatomic, retain) id<cancelSelectAll> cancelAllSelect;

-(void) selectAll:(BOOL)state count:(NSInteger) count;
-(NSMutableDictionary*) dataFilter;


@end
