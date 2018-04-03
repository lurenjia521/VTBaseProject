//
//  KTabBarViewController.m
//  BaseProject
//
//  Created by kangbinbin on 2018/2/27.
//  Copyright © 2018年 kangbinbin. All rights reserved.
//

#import "KTabBarViewController.h"
#import "VTHomeViewController.h"
#import "VTMineViewController.h"
#import "MainNavController.h"

#define TABBARITEMTEXTFOUN 12

@interface KTabBarViewController ()

@end

@implementation KTabBarViewController
+(void)initialize{
    
    //通过appearance 统一设置所有uitabbarItem的文字属性
    //后面带有UI_APPEARANCE_SELECTOR的方法，都可以通过appearance的对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAtts = [NSMutableDictionary dictionary];
//    selectedAtts[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAtts[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAtts[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAtts forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addChildVC];
    

}
-(void)addChildVC{
    
    [self setupChildVc:[[VTHomeViewController alloc]init] title:@"首页" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self setupChildVc:[[VTMineViewController alloc]init] title:@"我的" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
}
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    //设置标题和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//让图片显示原来的色 也可以在图片中直接修改
    MainNavController *nav = [[MainNavController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
