#import "BGOThirdViewController.h"
#import "BGOFourthViewController.h"
#import "BGOFifthViewController.h"

@interface BGOThirdViewController ()

@end

@implementation BGOThirdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Third View Controller";
    self.view.backgroundColor = [UIColor yellowColor];
}

- (IBAction)presentFourthView:(id)sender
{
    UIStoryboard *secondStoryboard = [UIStoryboard storyboardWithName:@"BGOSecondStoryboard" bundle:nil];
    
    UINavigationController *navigationController = [secondStoryboard instantiateViewControllerWithIdentifier:@"BGOSecondStoryboardNavigatorController"];
    BGOFourthViewController *fourViewController = (BGOFourthViewController *)navigationController.topViewController;
    
    fourViewController.presentingViewController = self;
    [self presentViewController:navigationController animated:YES completion:nil];
    
    self.fourthViewPresented = YES;
}

- (IBAction)presentFifthView:(id)sender {
    
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"fiftViewControllerNavigatorController"];
    [self presentViewController:navigationController animated:YES completion:nil];

}


@end
