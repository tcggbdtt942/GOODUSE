//
//  HomeViewController.m
//  iOSinClass
//
//  Created by DMT on 15/11/18.
//  Copyright (c) 2015年 olch. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController (){
    CGFloat  _centerX;
    CGFloat  _centerY;
    UIView  *_backgroundView;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _centerX = [UIScreen mainScreen].bounds.size.width / 2;
    _centerY = [UIScreen mainScreen].bounds.size.height / 2;
    self.view.backgroundColor = [UIColor blackColor];
    
    // 屏幕边缘pan手势(优先级高于其他手势)
    UIScreenEdgePanGestureRecognizer *leftEdgeGesture = \
    [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self
                                                      action:@selector(handleLeftEdgeGesture:)];
    leftEdgeGesture.edges = UIRectEdgeLeft;           // 屏幕左侧边缘响应
    [self.view addGestureRecognizer:leftEdgeGesture]; // 给self.view添加上
    
    // 设置一个UIView用来替换self.view,self.view用来当做背景使用
    _backgroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _backgroundView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_backgroundView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)handleLeftEdgeGesture:(UIScreenEdgePanGestureRecognizer *)gesture
{
    // 获取到当前被触摸的view
    UIView *view = [self.view hitTest:[gesture locationInView:gesture.view]
                            withEvent:nil];
    
    NSLog(@"tag = %ld", (long)view.tag);
    
    if(UIGestureRecognizerStateBegan == gesture.state ||
       UIGestureRecognizerStateChanged == gesture.state)
    {
        // 根据被触摸手势的view计算得出坐标值
        CGPoint translation = [gesture translationInView:gesture.view];
        NSLog(@"%@", NSStringFromCGPoint(translation));
        
        // 进行设置
        _backgroundView.center = CGPointMake(_centerX + translation.x, _centerY);
    }
    else
    {
        // 恢复设置
        [UIView animateWithDuration:.3 animations:^{
            _backgroundView.center = CGPointMake(_centerX, _centerY);
            
        }];
    }
}
@end
