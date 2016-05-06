//
//  WHSortViewController.m
//  WHLetao
//
//  Created by Wayne on 16/5/4.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHSortViewController.h"
#import "WHMetaDataTool.h"
@interface WHSortViewController ()

@end

@implementation WHSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = CGSizeMake(130, 15+45*self.sorts.count);
    for(int i = 0;i<self.sorts.count;i++){
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setBackgroundImage:[UIImage imageNamed:@"btn_filter_normal"] forState:UIControlStateNormal];
        [button setTitle:((WHSort*)self.sorts[i]).label forState:UIControlStateNormal];
        button.frame = CGRectMake(15, 15+45*i, 100, 30);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.tag = 100+i;
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    
//    self.view.backgroundColor = [UIColor redColor];
    
    
    // Do any additional setup after loading the view.
}
-(void)clickButton:(UIButton*)sender{

    
    long i = sender.tag -100;
    WHSort *sort = self.sorts[i];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"WHSortDidChange" object:self userInfo:@{@"SortValue":sort.value}];
    [self dismissViewControllerAnimated:YES completion:nil];
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
