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

@property (nonatomic, assign) BOOL showRefrehHeader;
@property (nonatomic, assign) BOOL showRefrehFooter;

//添加tableNode
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
