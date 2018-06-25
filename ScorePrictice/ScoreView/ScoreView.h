//
//  ScoreView.h
//  ScorePrictice
//
//  Created by apple on 2018/6/25.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreView : UIView

/**
 初始化评分

 @param frame 坐标
 @param viewCount 数据源个数
 @return 返回实例化对象
 */
- (instancetype)initWithFrame:(CGRect)frame viewCount:(NSInteger)viewCount;
@end
