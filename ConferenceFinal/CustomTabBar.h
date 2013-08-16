//
//  CustomTabBar.h
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-22.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreCtl.h"

@protocol TabBarDelegate;


@interface CustomTabBar : UIView
{
	UIImageView *_backgroundView;
	id<TabBarDelegate> _delegate;
	NSMutableArray *_buttons;
}
@property (nonatomic, retain) UIImageView *backgroundView;
@property (nonatomic, retain) id<TabBarDelegate> delegate;
@property (nonatomic, retain) NSMutableArray *buttons;


- (id)initWithFrame:(CGRect)frame buttonImages:(NSArray *)imageArray;
- (void)selectTabAtIndex:(NSInteger)index;
- (void)removeTabAtIndex:(NSInteger)index;
- (void)insertTabWithImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index;
- (void)setBackgroundImage:(UIImage *)img;

@end

@protocol TabBarDelegate <NSObject>

@optional
- (void)tabBar:(CustomTabBar *)tabBar didSelectIndex:(NSInteger)index;

@end