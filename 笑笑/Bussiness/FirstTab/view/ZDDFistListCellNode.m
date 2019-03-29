//
//  ZDDFistLIstCellNode.m
//  笑笑
//
//  Created by Maker on 2019/3/28.
//  Copyright © 2019 MakerYang.com. All rights reserved.
//

#import "ZDDFistListCellNode.h"
#import <YYCGUtilities.h>

@interface ZDDFistListCellNode ()


@property (nonatomic, strong) ASLayoutSpec *picturesLayout;

@property (nonatomic, strong) NSMutableArray *picturesNodes;


@end

@implementation ZDDFistListCellNode

//- (instancetype)init {
//    
//}
//
//
//
//- (void)addPicturesNodesWithFiles:(NSArray <ZDDFileModel *>*)files size:(CGSize)size {
//    CGSize itemSize = [self pictureSizeWithCount:files.count imageSize:size];
//    
//    [files enumerateObjectsUsingBlock:^(ZDDFileModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        ASNetworkImageNode *pictureNode = [ASNetworkImageNode new];
//        pictureNode.style.preferredSize = itemSize;
//        pictureNode.contentMode = UIViewContentModeScaleAspectFit;
//        pictureNode.backgroundColor = [UIColor lh_colorWithHexString:@"F8F8F8"];
//        pictureNode.defaultImage = [self placeholderImage];
//        [pictureNode setURL:[NSURL URLWithString:obj.fileUrl] size:obj.size];
//        [pictureNode addTarget:self action:@selector(onTouchPictureNode:) forControlEvents:ASControlNodeEventTouchUpInside];
//        [self addSubnode:pictureNode];
//        [self.picturesNodes addObject:pictureNode];
//    }];
//}

- (CGSize)pictureSizeWithCount:(NSInteger)count imageSize:(CGSize)imageSize {
    CGSize itemSize = CGSizeZero;
    CGFloat len1_3 = (ScreenWidth - 50.0f) / 3;
    len1_3 = CGFloatPixelRound(len1_3);
    switch (count) {
            case 1: {
                CGFloat imageW = imageSize.width;
                CGFloat imageH = imageSize.height;
                CGFloat maxWH = (ScreenWidth - 96.0f) / 3 * 2;
                CGFloat minWH = AUTO_FIT(130.0f);
                if (imageW == imageH) {
                    itemSize = CGSizeMake(maxWH, maxWH);
                } else if (imageH > imageW) {
                    itemSize = CGSizeMake(minWH, maxWH);
                } else {
                    itemSize = CGSizeMake(maxWH, minWH);
                }
                break;
            }
            //        case 2:
            //        case 3: {
            //            itemSize = CGSizeMake(len1_3, len1_3);
            //            break;
            //        }
            //        case 4: {
            //            itemSize = CGSizeMake(len1_3, len1_3);
            //            break;
            //        }
            //        case 5:
            //        case 6: {
            //            itemSize = CGSizeMake(len1_3, len1_3);
            //            break;
            //        }
        default: {
            // 7, 8, 9
            itemSize = CGSizeMake(len1_3, len1_3);
            break;
        }
    }
    return itemSize;
}

#pragma mark - Public
- (ASLayoutSpec *)picturesLayout {
    if (_picturesLayout) {
        return _picturesLayout;
    }
    ASLayoutSpec *layout = nil;
    switch (self.picturesNodes.count) {
            case 1:
            case 2:
            case 3: {
                layout = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:5.0f justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter children:[self.picturesNodes copy]];
                break;
            }
            case 4: {
                NSMutableArray *node1 = [NSMutableArray arrayWithCapacity:2];
                NSMutableArray *node2 = [NSMutableArray arrayWithCapacity:2];
                [self.picturesNodes enumerateObjectsUsingBlock:^(ASNetworkImageNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if (idx < 2) {
                        [node1 addObject:obj];
                        return ;
                    }
                    [node2 addObject:obj];
                }];
                NSMutableArray *tempChildren = @[].mutableCopy;
                [@[node1, node2] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    ASStackLayoutSpec *imgSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:5.0f justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter children:obj];
                    [tempChildren addObject:imgSpec];
                }];
                
                layout = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:5.0f justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:tempChildren.copy];
                break;
            }
            case 5:
            case 6: {
                NSMutableArray *node1 = [NSMutableArray arrayWithCapacity:3];
                NSMutableArray *node2 = [NSMutableArray array];
                [self.picturesNodes enumerateObjectsUsingBlock:^(ASNetworkImageNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if (idx < 3) {
                        [node1 addObject:obj];
                        return ;
                    }
                    [node2 addObject:obj];
                }];
                ASStackLayoutSpec *imgSpec1 = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:5.0f justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter children:node1];
                
                ASStackLayoutSpec *imgSpec2 = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:5.0f justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter children:node2];
                
                layout = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:5.0f justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[imgSpec1, imgSpec2]];
                break;
            }
            case 7:
            case 8:
            case 9: {
                NSMutableArray *node1 = [NSMutableArray arrayWithCapacity:3];
                NSMutableArray *node2 = [NSMutableArray arrayWithCapacity:3];
                NSMutableArray *node3 = [NSMutableArray array];
                [self.picturesNodes enumerateObjectsUsingBlock:^(ASNetworkImageNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if (idx < 3) {
                        [node1 addObject:obj];
                        return ;
                    } else if (idx < 6) {
                        [node2 addObject:obj];
                        return;
                    }
                    [node3 addObject:obj];
                }];
                ASStackLayoutSpec *imgSpec1 = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:5.0f justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter children:node1];
                
                ASStackLayoutSpec *imgSpec2 = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:5.0f justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter children:node2];
                
                ASStackLayoutSpec *imgSpec3 = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:5.0f justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter children:node3];
                
                layout = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:5.0f justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[imgSpec1, imgSpec2, imgSpec3]];
                break;
            }
        default:
            break;
    }
    _picturesLayout = layout;
    return layout;
}


- (NSMutableArray *)picturesNodes {
    if (_picturesNodes) {
        return _picturesNodes;
    }
    _picturesNodes = @[].mutableCopy;
    return _picturesNodes;
}
@end
