//
//  ViewController.m
//  Calculator
//
//  Created by Truong Bao Thang on 17/08/2015.
//  Copyright (c) Năm 2015 Truong Bao Thang. All rights reserved.
//

#import "ViewController.h"

typedef  enum
{
    CalculatorOperatorPlus  =  1 ,
    CalculatorOperatorMinus ,
    CalculatorOperatorDivide ,
    CalculatorOperatorMutil ,
}  CalculatorOperator ;

@interface ViewController ()
{
    
}
@end

@implementation ViewController
{
    CalculatorOperator cal;
    
}
@synthesize lbcalculator,stringNumberA,stringNumberB,stringNumberC,variable;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    stringNumberA = [[NSMutableString alloc]init];
    stringNumberB = [[NSMutableString alloc]init];
    stringNumberC = [[NSMutableString alloc]init];
    
    count =0;
    checkNegative = NO;
    isdecima = NO;
    checkPoint = NO;
    [lbcalculator setText:@"0"];
    
}

-(void)AddString:(NSString*)string{
    [stringNumberA appendString:string];
    if (count<10) {
        [self InsertString];
        [lbcalculator setText:stringNumberA];
    }
}
-(void)InsertString{
    if (isdecima==NO) {
        switch (count) {
            case 4:
                [stringNumberA insertString:@"," atIndex:1];
                break;
            case 5:
                [stringNumberA deleteCharactersInRange:[stringNumberA rangeOfString:@","]];
                [stringNumberA insertString:@"," atIndex:2];
                break;
            case 6:
                [stringNumberA deleteCharactersInRange:[stringNumberA rangeOfString:@","]];
                [stringNumberA insertString:@"," atIndex:3];
                break;
            case 7:
                [stringNumberA deleteCharactersInRange:[stringNumberA rangeOfString:@","]];
                [stringNumberA insertString:@"," atIndex:1];
                [stringNumberA insertString:@"," atIndex:5];
                break;
            case 8:
                [stringNumberA deleteCharactersInRange:[stringNumberA rangeOfString:@","]];
                [stringNumberA deleteCharactersInRange:[stringNumberA rangeOfString:@","]];
                [stringNumberA insertString:@"," atIndex:2];
                [stringNumberA insertString:@"," atIndex:6];
                break;
            case 9:
                [stringNumberA deleteCharactersInRange:[stringNumberA rangeOfString:@","]];
                [stringNumberA deleteCharactersInRange:[stringNumberA rangeOfString:@","]];
                [stringNumberA insertString:@"," atIndex:3];
                [stringNumberA insertString:@"," atIndex:7];
                break;
        }
    }
}
-(IBAction)Number:(id)sender{
    UIButton *button = (UIButton*)sender;
    if (button.tag < 10) {
        [self processWhenPressNumbericButonWithTagButton:button.tag];
        [self ChangeColor:0];
    }
    switch (button.tag) {
        case 10:
            //            day là " , "
            
            if (isdecima == NO) {
                isdecima = YES;
                [self AddString:@"."];
            }
            [self ChangeColor:0];
            break;
        case 11:
            //            đây là =
            checkPoint = NO;
            [self processWhenPressEqualOperator];
            break;
        case 12:
            //            đây là +
            if (checkPoint == YES) {
                [self processWhenPressEqualOperator];
            }
            cal = CalculatorOperatorPlus;
            [self ProcessWhenPressButton];
            [self ChangeColor:12];
            break;
        case 13:
            //            đây là -
            if (checkPoint == YES) {
                [self processWhenPressEqualOperator];
            }
            cal = CalculatorOperatorMinus;
            [self ProcessWhenPressButton];
            [self ChangeColor:13];
            break;
        case 14:
            //            đây là x
            if (checkPoint == YES) {
                [self processWhenPressEqualOperator];
            }
            cal = CalculatorOperatorMutil;
            [self ProcessWhenPressButton];
            [self ChangeColor:14];
            break;
        case 15:
            //            đây là /
            if (checkPoint == YES) {
                [self processWhenPressEqualOperator];
            }
            cal = CalculatorOperatorDivide;
            [self ProcessWhenPressButton];
            [self ChangeColor:15];
            break;
        case 16:
            //            đây là %
            numberOne = [lbcalculator.text floatValue];
            numberOne =  numberOne/100;
            [lbcalculator setText:[NSString stringWithFormat:@"%f",numberOne]];
            [stringNumberA setString:@""];
            [self ChangeColor:16];
            break;
        case 17:
            //            đây là +/-
            if (checkNegative == NO) {
                numberOne =[lbcalculator.text floatValue];
                numberOne =numberOne * -1;
                [lbcalculator setText:[NSString stringWithFormat:@"%f",numberOne]];
                checkNegative = YES;
            }else{
                numberOne =[lbcalculator.text floatValue];
                numberOne =numberOne * -1;
                [lbcalculator setText:[NSString stringWithFormat:@"%f",numberOne]];
                checkNegative = NO;
            }
            [self ChangeColor:17];
            break;
        case 18:
            //            đây là xoa
            [stringNumberA setString:@""];
            [self ChangeColor:0];
            count =0;
            checkNegative = NO;
            isdecima = NO;
            checkPoint = NO;
            [lbcalculator setText:@"0"];
            break;
    }
}
-(void)ProcessWhenPressButton{
    if (count<4) {
        numberOne = [stringNumberA floatValue];
    }
    if (3<count && count < 7) {
        [stringNumberA deleteCharactersInRange:[stringNumberA rangeOfString:@","]];
        numberOne = [stringNumberA floatValue];
    }
    if (6<count && count<10) {
        [stringNumberA deleteCharactersInRange:[stringNumberA rangeOfString:@","]];
        [stringNumberA deleteCharactersInRange:[stringNumberA rangeOfString:@","]];
        numberOne = [stringNumberA floatValue];
    }
    NSLog(@"%f",numberOne);
    [stringNumberA setString:@""];
    count =0;
    isdecima=NO;
    checkPoint = YES;
}

- (void) processWhenPressEqualOperator {
    if(stringNumberA.length !=0){
    if (count<4) {
        numberTwo = [stringNumberA floatValue];
    }
    if (3<count && count < 7) {
        [stringNumberA deleteCharactersInRange:[stringNumberA rangeOfString:@","]];
        numberTwo = [stringNumberA floatValue];
    }
    if (6<count && count<10) {
        [stringNumberA deleteCharactersInRange:[stringNumberA rangeOfString:@","]];
        [stringNumberA deleteCharactersInRange:[stringNumberA rangeOfString:@","]];
        numberTwo = [stringNumberA floatValue];
    }
        switch (cal) {
            case CalculatorOperatorPlus:
                numberOne = numberOne + numberTwo;
                break;
            case CalculatorOperatorMinus:
                numberOne = numberOne - numberTwo;
                break;
            case CalculatorOperatorDivide:
                numberOne = numberOne / numberTwo;
                break;
            case CalculatorOperatorMutil:
                numberOne = numberOne * numberTwo;
                break;
        }
        [stringNumberA setString:[NSString stringWithFormat:@"%f",numberOne]];
        NSRange locationRange= [stringNumberA rangeOfString:@"."];
        for (int i = stringNumberA.length-1; i >=locationRange.location; i--) {
            NSString * newString = [stringNumberA substringWithRange:NSMakeRange(i, 1)];
            if ([newString isEqualToString:@"0"]||[newString isEqualToString:@"."]) {
                [stringNumberA deleteCharactersInRange:NSMakeRange(i, 1)];
                [lbcalculator setText:[NSString stringWithFormat:@"%@",stringNumberA]];
            }else{
                break;
            }
        }
    }else{
        [stringNumberA setString:[NSString stringWithFormat:@"%f",numberOne]];
    }
    isdecima = NO;
    count = 0;
}

- (void) processWhenPressNumbericButonWithTagButton:(NSInteger)tag {
    switch (tag) {
        case 0:
            //            NSLog(@"day la 0");
            [self CheckCount];
            [self AddString:@"0"];
            break;
        case 1:
            //            NSLog(@"day la 1");
            [self CheckCount];
            [self AddString:@"1"];
            break;
        case 2:
            //            NSLog(@"day la 2");
            [self CheckCount];
            [self AddString:@"2"];
            break;
        case 3:
            //            NSLog(@"day la 3");
            [self CheckCount];
            [self AddString:@"3"];
            break;
        case 4:
            //            NSLog(@"day la 4");
            [self CheckCount];
            [self AddString:@"4"];
            break;
        case 5:
            //            NSLog(@"day la 5");
            [self CheckCount];
            [self AddString:@"5"];
            break;
        case 6:
            //            NSLog(@"day la 6");
            [self CheckCount];
            [self AddString:@"6"];
            break;
        case 7:
            //            NSLog(@"day la 7");
            [self CheckCount];
            [self AddString:@"7"];
            break;
        case 8:
            //            NSLog(@"day la 8");
            [self CheckCount];
            [self AddString:@"8"];
            break;
        case 9:
            //            NSLog(@"day la 9");
            [self CheckCount];
            [self AddString:@"9"];
            break;
    }
}
-(void)CheckCount{
    if (isdecima== NO) {
        count++;
    }
}

-(void)ChangeColor:(int)number{
    switch (number) {
        case 12:
            [self.btnPlus setBackgroundColor:[UIColor blackColor]];
            [self.btnDive setBackgroundColor:[UIColor orangeColor]];
            [self.btnMinus setBackgroundColor:[UIColor orangeColor]];
            [self.btnMulti setBackgroundColor:[UIColor orangeColor]];
            [self.btnNegative setBackgroundColor:[UIColor orangeColor]];
            [self.btnPercent setBackgroundColor:[UIColor orangeColor]];
            break;
        case 13:
            [self.btnPlus setBackgroundColor:[UIColor orangeColor]];
            [self.btnDive setBackgroundColor:[UIColor orangeColor]];
            [self.btnMinus setBackgroundColor:[UIColor blackColor]];
            [self.btnMulti setBackgroundColor:[UIColor orangeColor]];
            [self.btnNegative setBackgroundColor:[UIColor orangeColor]];
            [self.btnPercent setBackgroundColor:[UIColor orangeColor]];
            break;
        case 14:
            [self.btnPlus setBackgroundColor:[UIColor orangeColor]];
            [self.btnDive setBackgroundColor:[UIColor orangeColor]];
            [self.btnMinus setBackgroundColor:[UIColor orangeColor]];
            [self.btnMulti setBackgroundColor:[UIColor blackColor]];
            [self.btnNegative setBackgroundColor:[UIColor orangeColor]];
            [self.btnPercent setBackgroundColor:[UIColor orangeColor]];
            break;
        case 15:
            [self.btnPlus setBackgroundColor:[UIColor orangeColor]];
            [self.btnDive setBackgroundColor:[UIColor blackColor]];
            [self.btnMinus setBackgroundColor:[UIColor orangeColor]];
            [self.btnMulti setBackgroundColor:[UIColor orangeColor]];
            [self.btnNegative setBackgroundColor:[UIColor orangeColor]];
            [self.btnPercent setBackgroundColor:[UIColor orangeColor]];
            break;
        case 16:
            [self.btnPlus setBackgroundColor:[UIColor orangeColor]];
            [self.btnDive setBackgroundColor:[UIColor orangeColor]];
            [self.btnMinus setBackgroundColor:[UIColor orangeColor]];
            [self.btnMulti setBackgroundColor:[UIColor orangeColor]];
            [self.btnNegative setBackgroundColor:[UIColor orangeColor]];
            [self.btnPercent setBackgroundColor:[UIColor blackColor]];
            break;
        case 17:
            [self.btnPlus setBackgroundColor:[UIColor orangeColor]];
            [self.btnDive setBackgroundColor:[UIColor orangeColor]];
            [self.btnMinus setBackgroundColor:[UIColor orangeColor]];
            [self.btnMulti setBackgroundColor:[UIColor orangeColor]];
            [self.btnNegative setBackgroundColor:[UIColor blackColor]];
            [self.btnPercent setBackgroundColor:[UIColor orangeColor]];
            break;
        case 0:
            [self.btnPlus setBackgroundColor:[UIColor orangeColor]];
            [self.btnDive setBackgroundColor:[UIColor orangeColor]];
            [self.btnMinus setBackgroundColor:[UIColor orangeColor]];
            [self.btnMulti setBackgroundColor:[UIColor orangeColor]];
            [self.btnNegative setBackgroundColor:[UIColor orangeColor]];
            [self.btnPercent setBackgroundColor:[UIColor orangeColor]];
            break;
        default:
            break;
    }
    
    
    
}

@end
