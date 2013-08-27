//
//  LoginView.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-21.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "LoginView.h"
#import "testctlViewController.h"
#import "DropMenuCtl.h"

#define TEST 

@interface LoginView ()

@end

@implementation LoginView

@synthesize usrName;
@synthesize paswrd;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        [self.view setBackgroundColor:[UIColor colorWithRed:232 green:232 blue:232 alpha:1]];
    }
    return self;
}

- (void)viewDidLoad
{
    [usrName setEnabled:NO];
    [paswrd setEnabled:NO];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAction:(id)sender {
    
#ifdef TEST
    //初始化子视图
    ConfRoomCtl* firstVC = [[ConfRoomCtl alloc] init];
    CallBookCtl* secondVC = [[CallBookCtl alloc] init];
    RecentCtl* thirdVC = [[RecentCtl alloc] init];
    MoreCtl* lastVC = [[MoreCtl alloc] init];
     
    
    NSArray* ctlArr = [NSArray arrayWithObjects:firstVC, secondVC, thirdVC, lastVC, nil];
    
    //初始化图表
    NSMutableDictionary *imgDic = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic setObject:[UIImage imageNamed:@"menu1_01.png"] forKey:@"Default"];
    [imgDic setObject:[UIImage imageNamed:@"menu_01.png"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic2 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic2 setObject:[UIImage imageNamed:@"menu1_02.png"] forKey:@"Default"];
    [imgDic2 setObject:[UIImage imageNamed:@"menu_02.png"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic3 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic3 setObject:[UIImage imageNamed:@"menu1_03.png"] forKey:@"Default"];
    [imgDic3 setObject:[UIImage imageNamed:@"menu_03.png"] forKey:@"Seleted"];
    NSMutableDictionary *imgDic4 = [NSMutableDictionary dictionaryWithCapacity:3];
    [imgDic4 setObject:[UIImage imageNamed:@"menu1_04.png"] forKey:@"Default"];
    [imgDic4 setObject:[UIImage imageNamed:@"menu_04.png"] forKey:@"Seleted"];
    
    NSArray* imgArray = [[NSArray alloc] initWithObjects:imgDic, imgDic2, imgDic3, imgDic4, nil];
    
    MainTabCtl* tabBar = [[MainTabCtl alloc] initWithViewControllers:ctlArr imageArray:imgArray];
    
    [tabBar.tabBar setBackgroundImage:[UIImage imageNamed:@"foot.png"]];
    [tabBar setSelectedIndex:0];
    [self presentViewController:tabBar animated:YES completion:nil];
#else
    NSLog(@"test action.....");
    DropMenuCtl* test = [[DropMenuCtl alloc] init];
    [self presentViewController:test animated:NO completion:nil];
    
#endif

}
@end
