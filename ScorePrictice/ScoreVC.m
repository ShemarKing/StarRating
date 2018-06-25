//
//  ScoreVC.m
//  ScorePrictice
//
//  Created by apple on 2018/6/25.
//  Copyright © 2018 apple. All rights reserved.
//

#import "ScoreVC.h"
#import "ScoreView.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface ScoreVC ()
@property (nonatomic, strong) ScoreView *scoreView;
@end

@implementation ScoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.scoreView];
}

#pragma mark - initialize
- (ScoreView *)scoreView {
    if (!_scoreView) {
        _scoreView = [[ScoreView alloc] initWithFrame:CGRectMake(0, 200, ScreenW, ScreenW*3/2) viewCount:5];
    }
    return _scoreView;
}

@end
