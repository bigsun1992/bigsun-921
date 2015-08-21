//
//  ViewController.h
//  Calculator
//
//  Created by Truong Bao Thang on 17/08/2015.
//  Copyright (c) Năm 2015 Truong Bao Thang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{   BOOL isdecima;
    BOOL checkNegative;
    BOOL checkPoint;
    int count;
    float numberOne;
    float numberTwo;
    float result;


}
@property (strong, nonatomic) IBOutlet UIButton *btnPlus;
@property (strong, nonatomic) IBOutlet UIButton *btnMinus;
@property (strong, nonatomic) IBOutlet UIButton *btnMulti;
@property (strong, nonatomic) IBOutlet UIButton *btnDive;
@property (strong, nonatomic) IBOutlet UIButton *btnNegative;
@property (strong, nonatomic) IBOutlet UIButton *btnPercent;
@property(strong, nonatomic) NSString *variable;
@property(strong, nonatomic) NSMutableString *stringNumberA;
@property(strong, nonatomic) NSMutableString *stringNumberB;
@property(strong, nonatomic) NSMutableString *stringNumberC;
@property(strong, nonatomic) IBOutlet UILabel *lbcalculator;
-(IBAction)Number:(id)sender;
@end

