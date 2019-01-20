//
//  GHAttributesLabel.h
//  GHAttributesLabelDemo
//
//  Created by zhaozhiwei on 2019/1/20.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GHAttributesLabel : UILabel
typedef void(^GHAttributesBlock)(void);
/**

 @param text 传入富文本类型的字符串
 @param actionText 要响应事件的字符串
 */
- (void)setAttributesText: (NSMutableAttributedString *)text
               actionText: (NSString *)actionText;

/**
 点击事件回调
 */
@property (nonatomic , copy) GHAttributesBlock actionBlock;
@end

NS_ASSUME_NONNULL_END
