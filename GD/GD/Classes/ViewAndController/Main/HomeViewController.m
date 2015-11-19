//
//  HomeViewController.m
//  GD
//
//  Created by liuyixin on 15/11/3.
//  Copyright © 2015年 chenyue. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeSeachView.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark-navigationbar
    HomeSeachView *searchBar=[[HomeSeachView alloc]init];
    searchBar=[[[NSBundle mainBundle]loadNibNamed:@"HomeSeachView" owner:self options:nil]objectAtIndex:0];
    searchBar.frame=CGRectMake(0, 0,SCREEN_WIDTH, 44);
    [searchBar.SeachBar setBackgroundImage:[UIImage imageWithColor:THEME_COLOR]];
    
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width =-16;
    UIBarButtonItem*leftBarButton=[[UIBarButtonItem alloc]initWithCustomView:searchBar];
    self.navigationItem.leftBarButtonItems=[NSArray arrayWithObjects:negativeSpacer,leftBarButton,nil];
    // Do any additional setup after loading the view from its nib.
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

@end
