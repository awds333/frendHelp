#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *canvas;
@property (weak, nonatomic) IBOutlet UISlider *sliderR;
@property (weak, nonatomic) IBOutlet UISlider *sliderG;
@property (weak, nonatomic) IBOutlet UISlider *sliderB;
@property (weak, nonatomic) IBOutlet UISlider *sliderWidth;
@property (weak, nonatomic) IBOutlet UIButton *btSave;
@property (weak, nonatomic) IBOutlet UIButton *btClear;
@property (weak, nonatomic) IBOutlet UIImageView *showColor;
@property CGPoint lastPoint;
@property UIColor *lineColor;
@property float wigth;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLineColor:[UIColor redColor]];
    [self newImage];
    [_showColor setBackgroundColor:UIColor.redColor];
}


- (IBAction)onValueChanged:(id)sender {
    float R = [[self sliderR] value];
    float G = [[self sliderG]value];
    float B = [[self sliderB] value];
    //float Alpha = [[self sliderAlpha] value];
    [self setLineColor:[UIColor colorWithRed:R green:G blue:B alpha:1]];
    [[self showColor] setBackgroundColor:_lineColor];
}


- (IBAction)onTwo:(id)sender {
    float R = [[self sliderR] value];
    float G = [[self sliderG]value];
    float B = [[self sliderB] value];
    [self setLineColor:[UIColor colorWithRed:R green:G blue:B alpha:1]];
    [[self showColor] setBackgroundColor:_lineColor];
}


- (IBAction)onThree:(id)sender {
    float R = [[self sliderR] value];
    float G = [[self sliderG]value];
    float B = [[self sliderB] value];
    [self setLineColor:[UIColor colorWithRed:R green:G blue:B alpha:1]];
    [[self showColor] setBackgroundColor:_lineColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    if(touch.tapCount == 2){
        [_btClear setHidden:NO];
        [_btSave setHidden:NO];
    }

    if ([touch.view isEqual:self.canvas] == false){
        [self setLastPoint:[touch locationInView:self.canvas]];
    }
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    if (![touch.view isEqual:self.canvas]){
        CGPoint currentPoint = [touch locationInView:self.canvas];
        UIGraphicsBeginImageContext(self.canvas.frame.size);
        CGRect drawRect = CGRectMake(0.0f, 0.0f, self.canvas.frame.size.width, self.canvas.frame.size.height);
        [[[self canvas] image] drawInRect:drawRect];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        NSLog(@"%lf", _sliderWidth.value);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), _sliderWidth.value * 40);
        CGContextSetStrokeColorWithColor(UIGraphicsGetCurrentContext(), _lineColor.CGColor);
        CGContextBeginPath(UIGraphicsGetCurrentContext());
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), _lastPoint.x, _lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        [[self canvas] setImage:UIGraphicsGetImageFromCurrentImageContext()]; UIGraphicsEndImageContext();
        _lastPoint = currentPoint;
    }
}
- (IBAction)onClearPressed:(id)sender {
    [self newImage];
}
- (IBAction)onSavePressed:(id)sender {
    UIImageWriteToSavedPhotosAlbum(_canvas.image, nil, nil, nil);
    [self newImage];
    NSLog(@"Picture saved.");
}
-(void)newImage{
    [_btSave setHidden:YES];
    [_btClear setHidden:YES];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"ddMMyyHHmmss"];
    NSString *fileName = [NSString stringWithFormat:@"image_%@.png", [dateFormatter stringFromDate:[NSDate date]]];
    _canvas.image = [UIImage imageNamed:fileName];
    NSLog(@"Cleared!");
}
@end
