//
//  ViewController.m
//  1A2B
//
//  Created by Josh on 2015/6/2.
//  Copyright (c) 2015年 Josh. All rights reserved.
//

#import "ViewController.h"
#import "EndingViewController.h"
#import "DefeatViewController.h"


@interface ViewController (){



}

@property (weak, nonatomic) IBOutlet UIButton *button_1;
@property (weak, nonatomic) IBOutlet UIButton *button_2;
@property (weak, nonatomic) IBOutlet UIButton *button_3;
@property (weak, nonatomic) IBOutlet UIButton *button_4;
@property (weak, nonatomic) IBOutlet UIButton *button_5;
@property (weak, nonatomic) IBOutlet UIButton *button_6;
@property (weak, nonatomic) IBOutlet UIButton *button_7;
@property (weak, nonatomic) IBOutlet UIButton *button_8;
@property (weak, nonatomic) IBOutlet UIButton *button_9;
@property (weak, nonatomic) IBOutlet UIButton *button_0;
@property (weak, nonatomic) IBOutlet UIButton *buttonEnter;
@property (weak, nonatomic) IBOutlet UIButton *buttonDelete;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlayAndReplay;
@property (weak, nonatomic) IBOutlet UIButton *buttonAnswer;
@property (weak, nonatomic) IBOutlet UILabel *gusseLabel;
@property (weak, nonatomic) IBOutlet UITextView *historyTextView;



@property (strong,nonatomic)NSMutableArray  *gusseArray;
@property (strong,nonatomic)NSMutableArray  *questionArray;
@property (strong,nonatomic)NSMutableString  *gusseString;


@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _button_1.layer.cornerRadius=15;
    _button_2.layer.cornerRadius=15;
    _button_3.layer.cornerRadius=15;
    _button_4.layer.cornerRadius=15;
    _button_5.layer.cornerRadius=15;
    _button_6.layer.cornerRadius=15;
    _button_7.layer.cornerRadius=15;
    _button_8.layer.cornerRadius=15;
    _button_9.layer.cornerRadius=15;
    _button_0.layer.cornerRadius=15;
    _buttonEnter.layer.cornerRadius=15;
    _buttonDelete.layer.cornerRadius=15;
    _buttonAnswer.layer.cornerRadius=15;
    _historyTextView.layer.cornerRadius = 15;
    
    _buttonPlayAndReplay.layer.cornerRadius=15;

    _gusseArray=  [[NSMutableArray alloc] init];
//    _gusseString=[NSMutableString stringWithString:@""];
    _gusseString=  [[NSMutableString alloc] init];
    [self creatQuestion];
    [_historyTextView setEditable:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (IBAction)buttonNumber:(id)sender {
    
    
    UIButton *button = (UIButton *)sender;
    NSLog(@"button 的資訊%@",button);
    NSString *mesage = [button currentTitle];
    NSRange check = [_gusseString rangeOfString:(mesage)];
    
    if (_gusseArray.count!=4 && check.location== NSNotFound) {
        [_gusseArray addObject:(mesage)];
        NSLog(@"_gusseArray count==%@",_gusseArray);
        [_gusseString appendFormat:@"%@",mesage];
        _gusseLabel.text=_gusseString;
    }
}



- (IBAction)DeleteAction:(id)sender {
    
    NSInteger count=_gusseArray.count;
    
    if (count!=0) {
        [_gusseArray removeObjectAtIndex:count-1];
        NSLog(@"_gusseArray count==%@",_gusseArray);
        [_gusseString deleteCharactersInRange: NSMakeRange([_gusseString length]-1,1)];
       _gusseLabel.text=_gusseString;
        NSLog(@"%@" , _gusseString);
    }
}

- (IBAction)btnReplay:(id)sender {
    [self creatQuestion ];
     [_gusseArray removeAllObjects];
    [_gusseString deleteCharactersInRange: NSMakeRange(0,_gusseString.length)];
    _gusseLabel.text=_gusseString;
    _historyTextView.text=@"";
    _gusseLabel.text=@"";

    
}
- (IBAction)btnShowAnswer:(id)sender {
      [self performSegueWithIdentifier:@"DefeatSegue" sender:nil];
    
}

- (IBAction)btnGuess:(id)sender {
    
    if(_gusseString.length ==4) {
        _historyTextView.text= [self checkGusse];
        [_gusseArray removeAllObjects];
        [_gusseString deleteCharactersInRange: NSMakeRange(0,4)];
        //_gusseLabel.text=_gusseString;
        [_gusseLabel setText:@""];

        
    }
    else{
        
//        UIAlertView * warnAlert=[[UIAlertView alloc]initWithTitle:@"注意" message:@"您尚未輸入四個數字" delegate:nil cancelButtonTitle:@"繼續" otherButtonTitles: nil];
//
//        [warnAlert show];
        [self performSegueWithIdentifier:@"AttentionSegue" sender:nil];

    }
    
}



-(NSString*)creatQuestion{

    
    NSArray *Array = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithArray:Array];
    _questionArray = [[NSMutableArray alloc] init];
    
    
    int i;
    NSInteger count = Array.count;
    for (i = 0; i < 4; i ++) {
        int arc = arc4random()%(count - i);
        [_questionArray addObject:[tempArray objectAtIndex:arc]];
        [tempArray removeObjectAtIndex:arc];
        
        
    }
    NSLog(@"%@" , _questionArray);
    //NSLog(@"i=%@",[_questionArray objectAtIndex:1]);
    return 0;



}



-(NSString*)checkGusse{
    int i;
    int z;
    int Acount=0;
    int Bcount=0;
    
    for (i=0; i<=3; i++) {
        NSString * qst=[_questionArray objectAtIndex:i];
        
        NSString * gs=[_gusseArray objectAtIndex:i];
        if ([qst isEqualToString:gs]) {
            Acount++;
            NSLog(@"A is true");
        }
        else{
            for (z=0; z<=3; z++) {
                NSString * qstarray=[_questionArray objectAtIndex:z];
                
                if ([qstarray isEqualToString: gs]) {
                    Bcount++;
                    NSLog(@"B is true");
                }
            }
        }
    }
    

    
    
    
    if (Acount==4) {
        [self performSegueWithIdentifier:@"EndingSegue" sender:nil];

    }
    
    NSString * newHistory=[NSString stringWithFormat:@"%d A %d B  ➜  %@ \n",Acount,
                   Bcount,_gusseString];
    NSString *oldHistory=_historyTextView.text;
    NSString *allHistory=[NSString stringWithFormat:@"%@%@",newHistory,oldHistory];
    return allHistory;

}
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        [self btnReplay:nil];
    }
}


-(IBAction)backToReplay:(UIStoryboardSegue*)segue{
    NSLog(@"backToWhite");
        [self btnReplay:nil];
    
}
-(IBAction)backToHome:(UIStoryboardSegue*)segue{
        NSLog(@"backToHome");
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//在要前往下一個頁面之前可以先執行某些事前再前往
{
    if ([segue.identifier isEqualToString:@"EndingSegue"]||[segue.identifier isEqualToString:@"DefeatSegue"]) {
        
        
        int i;
        NSMutableString * answer;
        answer=[NSMutableString new];
        
        for (i=0; i<=3; i++) {
            NSString * qst=[_questionArray objectAtIndex:i];
            [answer appendFormat:@"%@",qst];
        }
                
        id target=segue.destinationViewController;
        [target setValue:answer forKey:@"lastAnswer"];
    
    }
    
}





@end
