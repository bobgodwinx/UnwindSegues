@import UIKit;

@interface BGOThirdViewController : UIViewController

- (IBAction)presentFourthView:(id)sender;
- (IBAction)presentFifthView:(id)sender;

@property (nonatomic, getter=isFourthViewPresented) BOOL fourthViewPresented;

@end
