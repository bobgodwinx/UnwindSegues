#import "BGOFourthViewController.h"

@interface BGOFourthViewController ()

@end

@implementation BGOFourthViewController

@synthesize presentingViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Fourth View in Another Storyboard";
    self.view.backgroundColor = [UIColor greenColor];
    
    NSLog(@"%@", self.presentingViewController);
}

- (IBAction)presentFirstView:(id)sender
{
    [self.navigationController performSegueWithIdentifier:@"unwindToFirstView" sender:self];
}


@end
