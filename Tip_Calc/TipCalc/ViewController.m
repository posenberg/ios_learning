//
//  ViewController.m
//  TipCalc
//
//  Created by Mel on 10/18/14.
//  Copyright (c) 2014 Melinda Po. All rights reserved.
//

//STORYBOARD has both INTREFACE AND IMPLEMENATION

#import "ViewController.h"
//UITextFieldDelegate
@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *amountField;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@property (assign, nonatomic) CGFloat tipPercentage;

- (IBAction)tipPercentageChanged:(UISegmentedControl*)sender;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tipPercentageChanged:(UISegmentedControl*)sender
{
    // HERE WE LINK AND MATH up the tip actions
    CGFloat tipPercentage = 0.1;
    
    switch (sender.selectedSegmentIndex) {
            case 0:
                tipPercentage = 0.1;
                break;
            case 1:
                tipPercentage = 0.15;
                break;
            case 2:
                tipPercentage = 0.20;
                break;
            default:
                break;
    }
    
    self.tipPercentage = tipPercentage;
    [self calculateNewTipAndTotal];
    
}
- (void)calculateNewTipAndTotal
{
    CGFloat currentBill = [self.amountField.text floatValue];
    //note: because we  have a property - we need SELF.tipPercentage.
    CGFloat newTipAmount = currentBill * self.tipPercentage;
    CGFloat newTotal = currentBill + newTipAmount;
    [self updateLabelstoTipAmount:newTipAmount total:newTotal];
}
//camelcase is only a naming convention
//MELNOTE: REMEMBER TO parenthesis (void)
- (void)updateLabelstoTipAmount:(CGFloat)tip total:(CGFloat)total
{

// MNOTE:how we format strings
// MNOTE:obj doesn't do "$" + tip like RUBY
    
// MNOTE: calling method is example [self updateLabelsToTipAmount:5.0 total: 30.0]
    
    self.amountLabel.text = [NSString stringWithFormat:@"$%0.2f", tip];
    self.totalLabel.text =[NSString stringWithFormat:@"$%0.2f",total];
    
    
}

- (void)doneButtonPressed{
    [self calculateNewTipAndTotal];
    [self.amountField resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField

{
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
}
@end
