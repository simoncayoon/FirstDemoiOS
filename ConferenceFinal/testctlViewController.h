//
//  testctlViewController.h
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-26.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface testctlViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_table;
}

@property(nonatomic, retain) UITableView* table;

@end
