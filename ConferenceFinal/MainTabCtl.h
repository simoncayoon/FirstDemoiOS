//
//  MainTabCtl.h
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-22.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTabBar.h"
#import "CallBookCtl.h"
#import "RecentCtl.h"
#import "ConfRoomCtl.h"

@class UITabBarController;
@protocol TabBarControllerDelegate;

@interface MainTabCtl : UIViewController<TabBarDelegate, toCallBookDelegate, callBookDelegate, disableOtherBtn>
{
    CustomTabBar    *_tabBar;
    UIView          *_containerView;
    UIView          *_transitionView;
    
    id<TabBarControllerDelegate> delegate;
    NSMutableArray  *viewCtls;
    NSUInteger      _selectedIndex;
    
    BOOL _tabBarTransparent;
    BOOL _tabBarHidden;
    
    NSInteger       animateDriect;
}
@property(nonatomic, copy) NSMutableArray *viewControllers;

@property(nonatomic, readonly) UIViewController *selectedViewController;
@property(nonatomic) NSUInteger selectedIndex;
@property(nonatomic) ConfRoomCtl* confroom;

// Apple is readonly
@property (nonatomic, readonly) CustomTabBar *tabBar;
@property(nonatomic,assign) id<TabBarControllerDelegate> delegate;


// Default is NO, if set to YES, content will under tabbar
@property (nonatomic) BOOL tabBarTransparent;
@property (nonatomic) BOOL tabBarHidden;

@property(nonatomic,assign) NSInteger animateDriect;

- (id)initWithViewControllers:(NSArray *)vcs imageArray:(NSArray *)arr;

- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;
- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated driect:(NSInteger)driect;

// Remove the viewcontroller at index of viewControllers.
- (void)removeViewControllerAtIndex:(NSUInteger)index;

// Insert an viewcontroller at index of viewControllers.
- (void)insertViewController:(UIViewController *)vc withImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index;

@end


@protocol TabBarControllerDelegate <NSObject>
@optional
- (BOOL)tabBarController:(MainTabCtl *)tabBarController shouldSelectViewController:(UIViewController *)viewController;
- (void)tabBarController:(MainTabCtl *)tabBarController didSelectViewController:(UIViewController *)viewController;
@end

@interface UIViewController (LeveyTabBarControllerSupport)
@property(nonatomic, readonly) MainTabCtl *leveyTabBarController;
@end

