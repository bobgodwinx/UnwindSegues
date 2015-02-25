#import "BGOFirstViewController.h"

@interface BGOFirstViewController ()

@end

@implementation BGOFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"First View Controller";
    self.view.backgroundColor = [UIColor redColor];
    
    //self.navigationController.hidesBarsOnSwipe = YES; //iOS8 but still buggy..
}

- (IBAction)unwindToTheFirstView:(UIStoryboardSegue *)segue
{
    NSLog(@"now we go back to the first view");
}

- (IBAction)presentView:(id)sender
{
    [self performSegueWithIdentifier:@"fromFirstViewToSecondView" sender:self];
}
@end
