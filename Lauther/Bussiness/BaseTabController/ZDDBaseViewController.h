//
//  ZDDBaseViewController.h
//  笑笑
//
//  Created by Maker on 2019/3/28.
//  Copyright © 2019 MakerYang.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZDDBaseViewController : UIViewController<ASTableDataSource, ASTableDelegate>

@property (nonatomic, strong, readonly) ASTableNode *tableNode;


//是否隐藏导航栏 默认不隐藏
@property (nonatomic, assign) BOOL hiddenNavBar;
//是否需要下拉刷新 默认不需要
@property (nonatomic, assign) BOOL showRefrehHeader;
//是否需要上拉刷新 默认不需要
@property (nonatomic, assign) BOOL showRefrehFooter;

//添加tableNode，默认没有添加
- (void)addTableNode;

//下拉刷新
- (void)headerRefresh;
//上拉刷新
- (void)footerRefresh;
//设置底部没有更多数据，不可以再刷新
- (void)setNoMoreData;
//设置底部可以再刷新
- (void)resetFooter;
@end

NS_ASSUME_NONNULL_END
