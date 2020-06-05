#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *indicator;
@property (weak, nonatomic) IBOutlet UITextField *our_text_field;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)our_button_func:(id)sender {
    if (![self.our_text_field.text isEqual:@""]) {
    [[self indicator] setText:@"10 C"];
    } else {
    [[self indicator] setText:@"Invalid city!"];
    }
}

@end
