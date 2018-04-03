//
//  MainNavController.m
//  BaseProject
//
//  Created by lianjie on 2017/10/31.
//  Copyright © 2017年 lianjie. All rights reserved.
//

#import "MainNavController.h"
#import "UIBarButtonItem+MainBar.h"
#import "BaseDefine.h"
@interface MainNavController ()

@end

@implementation MainNavController



///初始化
+(void)initialize
{
    
    [self setupNavigationTheme];
    
    [self setupBarButtonItemTheme];
    
}



///设置导航nav
+(void) setupNavigationTheme
{
    
    UINavigationBar *apperance = [UINavigationBar appearance];
    
    
    ///设置导航不透明
    [apperance setTranslucent:NO];
    
    ///设置导航的颜色
    
    [apperance setBarTintColor:[UIColor whiteColor]];
    
//    [apperance setBackgroundImage:[UIImage imageNamed:@"粉色背景@1x"] forBarMetrics:UIBarMetricsDefault];
    
    
    ///设置导航文字大、颜色等属性
    
    [apperance setTitleTextAttributes:@{NSForegroundColorAttributeName:NavRed,NSFontAttributeName:[UIFont systemFontOfSize:17.0f]}];
    
    
}

///设置item
+ (void) setupBarButtonItemTheme
{
    ///通过apprance对象设置整个项目的item样式
    UIBarButtonItem *apprance = [UIBarButtonItem appearance];
    
    ///设置文字的属性
    ///1、普通状态
    [apprance setTitleTextAttributes:@{NSForegroundColorAttributeName:NavRed,NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    
    
    [apprance setTitleTextAttributes:@{NSForegroundColorAttributeName:NavRed,NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateSelected];
    
    ///2、不能用的颜色
    [apprance setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateDisabled];
    
    
    ///设置背景：为了让某个按钮的背景消失，可以设置一张完全透明的背景图片
    [apprance setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
}
///重写push方法，能够拦截所有push进来的控制器

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        //这时候push进来的控制器ViewController，不是第一个子控制器
        //自动显示和隐藏tabBar
        viewController.hidesBottomBarWhenPushed = YES;
        
        UINavigationItem *vcBtnItem = [viewController navigationItem];
        //设置导航左边的按钮上的内容（图片&&文字）
        
        if (self.viewControllers.count>0 && self.viewControllers.count<2) {
            
            vcBtnItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"返回" highImage:@"返回" andTitle:@""];
//            [[self.childViewControllers lastObject] title]
            [vcBtnItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:NavRed,NSFontAttributeName:[UIFont systemFontOfSize:autoScaleW(26)]} forState:UIControlStateNormal];
            
            
        }else
        {
            vcBtnItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"返回" highImage:@"返回" andTitle:@""];
            [vcBtnItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:NavRed,NSFontAttributeName:[UIFont systemFontOfSize:autoScaleW(26)]} forState:UIControlStateNormal];
        }
    }
    [super pushViewController:viewController animated:animated];
}


//返回
-(void)back
{
    [self popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
