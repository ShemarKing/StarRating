//
//  ScoreView.m
//  ScorePrictice
//
//  Created by apple on 2018/6/25.
//  Copyright © 2018 apple. All rights reserved.
//

#import "ScoreView.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define Images(s) [UIImage imageNamed:s]

@interface ScoreView ()
@property (nonatomic, copy) NSMutableArray *viewArrays;
@end


@implementation ScoreView

- (instancetype)initWithFrame:(CGRect)frame viewCount:(NSInteger)viewCount {
    self = [super initWithFrame:frame];
    if (self) {
        [self createScoreViewWithViewCount:viewCount];
    }
    return self;
}

#pragma mark - private
//创建评分视图
- (void)createScoreViewWithViewCount:(NSInteger)viewCount {
    CGFloat spacing = 15;
    CGFloat itemWidth = 27;
    CGFloat itemHeight = itemWidth;
    
    for (int i = 0; i<viewCount; i++) {
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, i*(itemHeight+spacing), ScreenW, 50)];
        
        for (int j = 0; j<5; j++) {
            UIImageView *scoreImg = [[UIImageView alloc] initWithImage:Images(@"StarUnSelect")];
            [scoreImg setFrame:CGRectMake(j*(itemWidth+spacing)+spacing, 0, itemWidth, itemHeight)];
            [scoreImg setTag:j];
            [bgView addSubview:scoreImg];
            if (j == 4) {//最后一个视图
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(scoreImg.frame)+spacing, CGRectGetMinY(scoreImg.frame), ScreenW-CGRectGetMaxX(scoreImg.frame), CGRectGetHeight(scoreImg.frame))];
                [bgView addSubview:label];
            }
        }
        
        [self.viewArrays addObject:bgView];
        
        [self addSubview:bgView];
    }
}


#pragma mark - touchAction
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    UIView *bgView = [touch view];
    CGPoint point = [touch locationInView:bgView];
    int i = 0;
    NSInteger count = 0;
    UILabel *contenLbl;
    for (UIView *subView in bgView.subviews) {
        if ([subView isKindOfClass:[UIImageView class]]) {
            
            count += [self changeImage:point.x imageView:(UIImageView *)subView];
            if (count == 0) {
                count = 1;
                [(UIImageView *)subView setImage:Images(@"StarSelectHeaf")];
            }
            i++;
        }
        if ([subView isKindOfClass:[UILabel class]]) {
            contenLbl = (UILabel *)subView;
        }
    }
    
    [self scoreComment:count ContentLbl:contenLbl];

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    UIView *bgView = [touch view];
    CGPoint point = [touch locationInView:bgView];
    int i = 0;
    NSInteger count = 0;
    UILabel *contenLbl;
    for (UIView *subView in bgView.subviews) {
        if ([subView isKindOfClass:[UIImageView class]]) {
            count += [self changeImage:point.x imageView:(UIImageView *)subView];
            i++;
        }
        if ([subView isKindOfClass:[UILabel class]]) {
            contenLbl = (UILabel *)subView;
        }
    }
    [self scoreComment:count ContentLbl:contenLbl];
    

}

//星级评论
- (void)scoreComment:(NSInteger)scoreCount ContentLbl:(UILabel *)label{
    switch (scoreCount) {
        case 1:
        case 2:
            [label setText:@"很差，不推荐"];
            break;
        case 3:
        case 4:
            [label setText:@"凑合，可考虑"];
            break;
        case 5:
        case 6:
            [label setText:@"一般，还值得"];
            break;
        case 7:
        case 8:
            [label setText:@"不错，要推荐"];
            break;
        default:
            [label setText:@"完美，不错过"];
            break;
    }
}

- (NSInteger)changeImage:(CGFloat)X imageView:(UIImageView *)imageView {
    if (X>imageView.frame.origin.x + imageView.frame.size.width*0.5) {
        //整星
        [imageView setImage:Images(@"StarSelected")];
        return 2;
    }else if (X>imageView.frame.origin.x){
        [imageView setImage:Images(@"StarSelectHeaf")];
        return 1;
    }else {
        [imageView setImage:Images(@"StarUnSelect")];
        return 0;
    }
    
}

#pragma mark - initialize
- (NSMutableArray *)viewArrays {
    if (!_viewArrays) {
        _viewArrays = [NSMutableArray array];
    }
    return _viewArrays;
}

@end
