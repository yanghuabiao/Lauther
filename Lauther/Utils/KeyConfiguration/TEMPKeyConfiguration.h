//
//  TEMPKeyConfiguration.h
//  Template
//
//  Created by 张冬冬 on 2019/3/5.
//  Copyright © 2019 KWCP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TEMPMacro.h"
NS_ASSUME_NONNULL_BEGIN
typedef NSString * ZDDKey;
@interface TEMPKeyConfiguration : NSObject

TEMP_EXTERN ZDDKey const JPUSH_KEY;
TEMP_EXTERN ZDDKey const JPUSH_CHANNEL;
@end

NS_ASSUME_NONNULL_END
