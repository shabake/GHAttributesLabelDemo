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
- (void)setAttributesText: (NSMutableAttributedString *)text actionText: (NSString *)actionText;

@property (nonatomic , copy) GHAttributesBlock actionBlock;
@end

NS_ASSUME_NONNULL_END
