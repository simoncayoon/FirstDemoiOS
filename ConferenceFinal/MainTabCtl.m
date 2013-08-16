//
//  MainTabCtl.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-22.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "MainTabCtl.h"
//#import "ConfRoomCtl.h"
//#import "CallBookCtl.h"
#import "MoreCtl.h"
#define TabBarHeight 55.0f

//@interface UINavigationBar (myNavigationBar)
//
//@end
//
//@implementation UINavigationBar (myNavigationBar)
//
//-(void) drawRect:(CGRect)rect{
//    UIImage *barImage = [UIImage imageNamed:@"top.png"];
//    [barImage drawInRect:rect];
//}
//
//@end
static MainTabCtl *mainTabCtl;
@implementation UIViewController(TabBarControllerSuppport)

- (MainTabCtl *) mainTabCtl{
    return mainTabCtl;
}

@end

@implementation MainTabCtl

@synthesize tabBar = _tabbar;
@synthesize selectedIndex = _selectedIndex;
@synthesize delegate = _delegate;
@synthesize animateDriect = _animateDriect;
@synthesize viewControllers = _viewControllers;
@synthesize selectedViewController;
@synthesize tabBarHidden;
@synthesize tabBarTransparent;

-(id) initWithViewControllers:(NSArray *)vcs imageArray:(NSArray *)arr
{
    self = [super init];
    NSLog(@"welcome to the mainview");
    if(self != nil){
        _viewControllers = [NSMutableArray arrayWithArray:vcs];
        _containerView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
        ;
        _transitionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320.0f, _containerView.frame.size.height - TabBarHeight)];
        _transitionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        _tabbar = [[CustomTabBar alloc] initWithFrame:CGRectMake(0, _containerView.frame.size.height - TabBarHeight, 320.0f, TabBarHeight) buttonImages:arr];
        _tabbar.delegate = self;
        mainTabCtl = self;
        
        //*****delegate**********//
        ConfRoomCtl *confroom = [_viewControllers objectAtIndex:0];
        confroom.delegate = self;
        
        CallBookCtl *callbook = [_viewControllers objectAtIndex:1];
        callbook.delegate = self;
        animateDriect = 0;
    
        MoreCtl *moreCtl = [_viewControllers objectAtIndex:3];
        moreCtl.hideBtnDelegate = self;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_containerView addSubview:_transitionView];
    [_containerView addSubview:_tabbar];
    self.view = _containerView;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//自定义方法

-(CustomTabBar *)tabBar{
    
    return _tabbar;
}

#pragma mark - Private methods
-(NSUInteger) selectedIndex
{
    return _selectedIndex;
}

-(UIViewController *) selectedViewController
{
    return [_viewControllers objectAtIndex:_selectedIndex];
}

-(void) setSelectedIndex:(NSUInteger)index
{
    [self displayViewAtIndex:index];
    [_tabbar selectTabAtIndex:index];
}

-(void) displayViewAtIndex:(NSUInteger) index
{
    // Before change index, ask the delegate should change the index.
    if ([_delegate respondsToSelector:@selector(tabBarController:shouldSelectViewController:)])
    {
        if (![_delegate tabBarController:self shouldSelectViewController:[self.viewControllers objectAtIndex:index]])
        {
            return;
        }
    }
    // If target index if equal to current index, do nothing.
    if (_selectedIndex == index && [[_transitionView subviews] count] != 0)
    {
        return;
    }
    _selectedIndex = index;
    
	UIViewController *selectedVC = [self.viewControllers objectAtIndex:index];
    
	selectedVC.view.frame = _transitionView.frame;
	if ([selectedVC.view isDescendantOfView:_transitionView])
	{
        NSLog(@"descendant:");
		[_transitionView bringSubviewToFront:selectedVC.view];
	}
	else
	{
        NSLog(@"no descendant");
		[_transitionView addSubview:selectedVC.view];
	}
    
    // Notify the delegate, the viewcontroller has been changed.
    if ([_delegate respondsToSelector:@selector(tabBarController:didSelectViewController::)])
    {
        [_delegate tabBarController:self didSelectViewController:selectedVC];
    }
}

- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated{
    /*
     *
     */
}

- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated driect:(NSInteger)driect{
    /*
     *
     */
}

-(void) removeViewControllerAtIndex:(NSUInteger)index{
    /*
     *
     */
}

-(void) insertViewController:(UIViewController *)vc withImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index{
    /*
     *
     */
}

#pragma mark -
#pragma mark tabBar delegate
-(void) tabBar:(CustomTabBar *)tabBar didSelectIndex:(NSInteger)index
{

    [self displayViewAtIndex:index];
}

-(void) showControllerOfTow
{
    [self setSelectedIndex:1];
}

- (void) showFromCallBook:(NSMutableDictionary *)dataArray
{
    [self setSelectedIndex:0];
    ConfRoomCtl* ctl = [_viewControllers objectAtIndex:0];
    ctl.confAction.dataDic = dataArray;
    ctl.confAction.arrayRow = [dataArray objectForKey:@"numlist"];
    [ctl.confAction.tableView reloadData];
    [ctl showList];
}

-(void) disableBtn{
    
    NSLog(@"disable btn action");
    for (int i=0; i<3; i++) {
        [[self.tabBar.buttons objectAtIndex:i] setEnabled:NO];
    }
}

- (void) recoverBtn{
    NSLog(@"disable btn action");
    for (int i=0; i<3; i++) {
        [[self.tabBar.buttons objectAtIndex:i] setEnabled:YES];
    }
}


@end
