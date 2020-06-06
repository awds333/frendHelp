//
//  ViewController.m
//  Task1.2
//
//  Created by Pavel Bandiuk on 22.05.2020.
//  Copyright © 2020 Pavel Bandiuk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *regV;
@property (weak, nonatomic) IBOutlet UITextField *loginL;
@property (weak, nonatomic) IBOutlet UITextField *emailL;
@property (weak, nonatomic) IBOutlet UITextField *passL;
@property (weak, nonatomic) IBOutlet UITextField *repassL;
@property (weak, nonatomic) IBOutlet UITextField *passR;
@property (weak, nonatomic) IBOutlet UITextField *loginR;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.regV setHidden:YES];
    NSUserDefaults* user = [NSUserDefaults standardUserDefaults];
    if([user objectForKey:@"login"] != nil || [user objectForKey:@"pass"] != nil) {
        [self performSegueWithIdentifier:@"closeZone" sender:self];
    }
}

- (IBAction)segment:(id)sender {
    UISegmentedControl *seg = (UISegmentedControl* ) sender;
    NSInteger select = seg.selectedSegmentIndex;
    
    if(select == 0) {			
        [self.regV setHidden:YES];
    } else {
        [self.regV setHidden:NO];
    }
}

- (IBAction)buttonL:(id)sender {
    if(![self.loginR.text isEqualToString:@""] || [self.passR.text isEqualToString:@""]) {
        NSUserDefaults* user = [NSUserDefaults standardUserDefaults];
        [user setObject:self.loginR.text forKey:@"login"];
        [user setObject:self.passR.text forKey:@"pass"];
        [self performSegueWithIdentifier:@"closeZone" sender:self];
    }
}

@end
