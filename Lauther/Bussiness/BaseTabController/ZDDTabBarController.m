//
//  ZDDTabBarController.m
//  Template
//
//  Created by 张冬冬 on 2019/2/19.
//  Copyright © 2019 KWCP. All rights reserved.
//

#import "ZDDTabBarController.h"
#import "ZDDThemeConfiguration.h"
#import "TEMPMacro.h"

#import "ZDDNavController.h"

#import "ZDDThridController.h"
#import "ZDDSecondController.h"
#import "ZDDFirstController.h"


@interface ZDDTabBarController ()
<
UITabBarControllerDelegate
>
@property (nonatomic, assign) BOOL hasCenterButton;
@end

@implementation ZDDTabBarController

- (instancetype)initWithCenterButton:(BOOL)hasCenterButton {
    _hasCenterButton = hasCenterButton;
    self = [super init];
    if (self) {
        ZDDThemeConfiguration *theme = [ZDDThemeConfiguration defaultConfiguration];
        [self.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: theme.selectTabColor} forState:UIControlStateSelected];
        [self.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: theme.normalTabColor} forState:UIControlStateNormal];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildViewControllers];
    self.delegate = self;
    self.hasCenterButton = NO;
    if (self.hasCenterButton) {
        UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.tabBar addSubview:addButton];
        addButton.frame = CGRectMake((SCREENWIDTH - 45)/2.0, 5, 45, HEIGHT(self.tabBar) - 20);
        UIImage *image = [[UIImage imageNamed:@"tab_add"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [addButton setImage:image forState:UIControlStateNormal];
        [addButton addTarget:self action:@selector(addButtonClick) forControlEvents:UIControlEventTouchUpInside];
        addButton.adjustsImageWhenDisabled = NO;
        addButton.adjustsImageWhenHighlighted = NO;
        ZDDThemeConfiguration *theme = [ZDDThemeConfiguration defaultConfiguration];
        addButton.backgroundColor = theme.selectTabColor;
        addButton.tintColor = theme.addButtonColor;
    }
}

- (void)addButtonClick {
    NSLog(@"%@", @"fuck");
}

- (void)setupChildViewControllers {
    ZDDFirstController *one = [[ZDDFirstController alloc] init];

    [self addChileVcWithTitle:@"菜谱大全" vc:one imageName:@"tab_now_nor" selImageName:@"tab_now_press"];
    
    ZDDSecondController *second = [[ZDDSecondController alloc] init];
    [self addChileVcWithTitle:@"笔记圈" vc:second imageName:@"tab_qworld_nor" selImageName:@"tab_qworld_press"];
    
    
    ZDDFirstController *three = [[ZDDFirstController alloc] init];
    [self addChileVcWithTitle:@"个人中心" vc:three imageName:@"tab_recent_nor" selImageName:@"tab_recent_press"];
    
    
    
}

- (void)addChileVcWithTitle:(NSString *)title vc:(UIViewController *)vc imageName:(NSString *)imageName selImageName:(NSString *)selImageName {
    [vc.tabBarItem setTitle:title];
    if (title.length) {
        [vc.tabBarItem setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [vc.tabBarItem setSelectedImage:[[UIImage imageNamed:selImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    }
    ZDDNavController *navVc = [[ZDDNavController alloc] initWithRootViewController:vc];
    [self addChildViewController:navVc];
}


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    //点击发布
//    if ([tabBarController.viewControllers objectAtIndex:2] == viewController) {
//        if (self.hasCenterButton) {
//            [self addButtonClick];
//            return NO;
//        }
//        return NO;
//    }
    return YES;
}

@end
