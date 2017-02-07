//
//  ViewController.m
//  Demo-button
//
//  Created by Daniel.Jin on 16/9/27.
//  Copyright © 2016年 Daniel.Jin. All rights reserved.
//

#import "ViewController.h"

#define screenW [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *btnArray;
@property (strong, nonatomic) NSMutableArray *selectedArray;
@property (strong, nonatomic) UIButton *btn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btnArray = [NSMutableArray array];
    self.selectedArray = [NSMutableArray array];
 
    [self setupBtn];
}

- (void)setupBtn{
    int btnW = (screenW - 80) / 3;
    int s = 0;
    
    for(UIView *view in [self.view subviews])
    {
        [view removeFromSuperview];
    }
    
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j ++) {
           UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20 + (btnW + 20) * j, 100 + 60 * i, btnW, 40)];
            btn.layer.borderWidth = 1.0;
            btn.layer.borderColor = [UIColor grayColor].CGColor;
            btn.layer.cornerRadius = 5.0;
            [btn setTitle:[NSString stringWithFormat:@"%d",s]forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.tag = s;
            s ++;

      
            btn.backgroundColor = [UIColor whiteColor];

            
            [self.view addSubview:btn];
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.btnArray addObject:btn];
        }
        
    }

}

- (void)btnAction:(UIButton *)sender {

        if (self.selectedArray.count > 0) {
            self.btn = self.selectedArray[0];
            self.btn.backgroundColor = [UIColor whiteColor];
            [self.selectedArray removeAllObjects];
        }
        [self.selectedArray addObject:sender];
        UIButton *btn = self.selectedArray[0];
        btn.backgroundColor = [UIColor redColor];
    
    if (self.btn == sender) {
        if (self.btn.selected == YES) {
            self.btn.selected = NO;
            self.btn.backgroundColor = [UIColor whiteColor];
        }
        else {
            self.btn.selected = YES;
            self.btn.backgroundColor = [UIColor redColor];
        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
