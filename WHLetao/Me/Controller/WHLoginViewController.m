//
//  WHLoginViewController.m
//  WHLetao
//
//  Created by Way_Lone on 16/5/3.
//  Copyright © 2016年 WayneHu. All rights reserved.
//

#import "WHLoginViewController.h"

@interface WHLoginViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *thirdConstraint;
@property (nonatomic,assign) NSInteger constraintConstant;

@end

@implementation WHLoginViewController
-(void)updateViewConstraints{
    [super updateViewConstraints];
    self.constraintConstant =([UIScreen mainScreen].bounds.size.width-16*2-50*4)/3;
    if (self.secondConstraint.constant== self.constraintConstant) {
        return;
    }
    self.secondConstraint.constant= self.constraintConstant;
    self.thirdConstraint.constant = self.secondConstraint.constant;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem.image = [[UIImage alloc]init];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem.title = @"取消";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(userRegister)];
    // Do any additional setup after loading the view.
}
-(void)userRegister{
    
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
