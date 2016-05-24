//
//  ViewController.m
//  CurrencyConverter
//
//  Created by Miguel Melendez on 5/22/16.
//  Copyright © 2016 Miguel Melendez. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController() <CRCurrencyRequestDelegate>
@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *curA;
@property (weak, nonatomic) IBOutlet UILabel *curB;
@property (weak, nonatomic) IBOutlet UILabel *curC;

@end

@implementation ViewController

- (IBAction)convertButtonPressed:(id)sender {
    self.convertButton.enabled = NO;
    
    self.req  = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    
    [self.req start];
    
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies {
    self.convertButton.enabled = YES;
    self.curA.text = @"YAY";
    
    double inputValue = [self.inputField.text floatValue];
    double eurValue = inputValue * currencies.EUR;
    NSString *eur =  [NSString stringWithFormat:@"%.2f", eurValue];
    self.curA.text = eur;
    double yenValue = inputValue * currencies.JPY;
    NSString *yen =  [NSString stringWithFormat:@"%.2f", yenValue];
    self.curB.text = yen;
    double gbpValue = inputValue * currencies.GBP;
    NSString *gbp =  [NSString stringWithFormat:@"%.2f", gbpValue];
    self.curC.text = gbp;
}


@end
