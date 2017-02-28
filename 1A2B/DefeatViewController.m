//
//  DefeatViewController.m
//  1A2B
//
//  Created by Josh on 2015/6/16.
//  Copyright (c) 2015年 Josh. All rights reserved.
//

#import "DefeatViewController.h"

#import "EndingViewController.h"

#import "ViewController.h"


@interface DefeatViewController ()
@property (weak, nonatomic) IBOutlet UILabel *defeatAnswerLabel;

@end

@implementation DefeatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _defeatAnswerLabel.text=_lastAnswer;
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6]];

    // Do any additional setup after loading the view.
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
