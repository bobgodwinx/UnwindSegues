#import "BGOSecondViewController.h"

@interface BGOSecondViewController ()

@end

@implementation BGOSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Second View Controller";
    self.view.backgroundColor = [UIColor blueColor];
}

- (IBAction)presentView:(id)sender
{
    [self performSegueWithIdentifier:@"fromSecondViewToThirdView" sender:self];
}
@end
