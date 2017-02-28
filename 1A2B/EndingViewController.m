//
//  EndingViewController.m
//  1A2B
//
//  Created by Josh on 2015/6/11.
//  Copyright (c) 2015年 Josh. All rights reserved.
//

#import "EndingViewController.h"
#import "ViewController.h"
#import "DefeatViewController.h"




@interface EndingViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lastAnswerLable;

@end

@implementation EndingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lastAnswerLable.text=_lastAnswer;
    [self.view setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.6]];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)presentModalViewController:(UIViewController *)modalViewController animated:(BOOL)animate{


}

@end
