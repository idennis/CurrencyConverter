//
//  ViewController.m
//  PeerReview3
//
//  Created by Dennis Hou on 20/8/17.
//  Copyright © 2017 dennis hou. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;

@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;

@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;

@end

@implementation ViewController

- (IBAction)convertButtonTapped:(id)sender {
    self.convertButton.enabled = NO;
    
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    
    double inputValue = [self.inputField.text floatValue];
    double euroValue = inputValue * currencies.EUR;
    
    self.currencyA.text = [NSString stringWithFormat:@"€%.2f", euroValue];
    
    double yenValue = inputValue * currencies.JPY;
    self.currencyB.text = [NSString stringWithFormat:@"¥%.2f", yenValue];
    
    double poundValue = inputValue * currencies.EUR;
    self.currencyC.text = [NSString stringWithFormat:@"£%.2f", poundValue];
    
    self.convertButton.enabled = YES;
}



@end
