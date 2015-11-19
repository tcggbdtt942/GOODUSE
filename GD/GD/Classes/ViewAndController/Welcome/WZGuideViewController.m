//
//  WZGuideViewController.m
//  NPM
//
//  Created by zjm on 15/7/3.
//  Copyright (c) 2015年 DreamTouch. All rights reserved.
//

#import "WZGuideViewController.h"
#import "Constants.h"

@interface WZGuideViewController ()<UIScrollViewDelegate>

@end

@implementation WZGuideViewController

@synthesize animating=_animating;
@synthesize pageScroll=_pageScroll;
@synthesize pageControl=_pageControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = THEME_COLOR;
    }
    return self;
}

#pragma mark -

- (CGRect)onscreenFrame
{
    //return [UIScreen mainScreen].applicationFrame;
    return [UIScreen mainScreen].bounds; //@GO
}

- (void)showGuide
{
    if (!_animating && self.view.superview == nil)
    {
        [WZGuideViewController sharedGuide].view.frame = [self onscreenFrame];
        [[self mainWindow] addSubview:[WZGuideViewController sharedGuide].view];
        
        _animating = YES;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.4];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(guideShown)];
        [WZGuideViewController sharedGuide].view.frame = [self onscreenFrame];
        [UIView commitAnimations];
    }
}

- (void)guideShown
{
    _animating = NO;
}

- (void)hideGuide
{
    if (!_animating && self.view.superview != nil)
    {
        _animating = YES;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.4];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(guideHidden)];
        [WZGuideViewController sharedGuide].view.frame = CGRectMake(-SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [UIView commitAnimations];
    }
}

- (void)guideHidden
{
    _animating = NO;
    [[[WZGuideViewController sharedGuide] view] removeFromSuperview];
}

- (UIWindow *)mainWindow
{
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)])
    {
        return [app.delegate window];
    }
    else
    {
        return [app keyWindow];
    }
}

+ (void)show
{
    [[WZGuideViewController sharedGuide].pageScroll setContentOffset:CGPointMake(0.f, 0.f)];
    [[WZGuideViewController sharedGuide] showGuide];
}

+ (void)hide
{
    [[WZGuideViewController sharedGuide] hideGuide];
}

#pragma mark -

+ (WZGuideViewController *)sharedGuide
{
    @synchronized(self)
    {
        static WZGuideViewController *sharedGuide = nil;
        if (sharedGuide == nil)
        {
            sharedGuide = [[self alloc] init];
        }
        return sharedGuide;
    }
}

- (void)pressEnterButton:(UIButton *)enterButton
{
    [self hideGuide];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:VERSION];
    [[NSUserDefaults standardUserDefaults] synchronize];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect frame = [self onscreenFrame];
    NSArray *imageNameArray;
    imageNameArray = [NSArray arrayWithObjects:@"Loading1", @"Loading2",@"Loading3", @"Loading4", nil];
    
    
    _pageScroll = [[UIScrollView alloc] initWithFrame:frame]; //@GO
    self.pageScroll.pagingEnabled = YES;
    self.pageScroll.bounces=NO;
    self.pageScroll.showsHorizontalScrollIndicator=NO;
    self.pageScroll.contentSize = CGSizeMake(self.view.frame.size.width * imageNameArray.count, self.view.frame.size.height);
    self.pageScroll.delegate=self;
    
    self.pageControl=[[UIPageControl alloc] init];
    self.pageControl.center=CGPointMake(CGRectGetMidX(frame), SCREEN_HEIGHT-30);
    self.pageControl.numberOfPages=imageNameArray.count;
    self.pageControl.bounds=CGRectMake(0, 0, 150, 0);
    
    [self.view addSubview:self.pageScroll];
    [self.view addSubview:self.pageControl];
    
    NSString *imgName = nil;
    UIView *view;
    for (int i = 0; i < imageNameArray.count; i++) {
        imgName = [imageNameArray objectAtIndex:i];
        view = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width * i), 0.f, self.view.frame.size.width, self.pageScroll.frame.size.height)];
        
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:view.bounds];
        imageView.image = [[UIImage imageNamed:imgName] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
        [view addSubview:imageView];
        
        [self.pageScroll addSubview:view];
        
        if (i == imageNameArray.count - 1) {
            
            UIButton *enterButton = [[UIButton alloc] init];
            [enterButton setFrame:CGRectMake(0.f, 0.f, SCREEN_WIDTH*0.41, SCREEN_HEIGHT*0.063)];
            [enterButton setCenter:CGPointMake(self.view.center.x, SCREEN_HEIGHT*0.88)];
            enterButton.titleLabel.font = [UIFont boldSystemFontOfSize: SCREEN_WIDTH*0.045];
            [enterButton setTitle:@"立即体验" forState:UIControlStateNormal];
            enterButton.layer.cornerRadius=5;
            [enterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [enterButton setBackgroundColor:Rgb2UIColor(66, 174, 210, 1)];
            [enterButton addTarget:self action:@selector(pressEnterButton:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:enterButton];
            
        }
    }
    
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

#pragma mark - 滚动代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
}

@end
