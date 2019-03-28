//
//  ZDDFirstController.m
//  笑笑
//
//  Created by Maker on 2019/3/28.
//  Copyright © 2019 MakerYang.com. All rights reserved.
//

#import "ZDDFirstController.h"

@interface ZDDFirstController ()

/** <#class#> */
@property (nonatomic, strong) NSMutableArray *dataArr;


@end

@implementation ZDDFirstController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addTableNode];
    self.showRefrehHeader = YES;;
    self.showRefrehFooter = YES;

}

- (void)headerRefresh {
    
}

- (void)footerRefresh {
    
}

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

@end
