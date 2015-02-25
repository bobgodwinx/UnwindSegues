#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <objc/runtime.h>
#import "BGOFirstViewController.h"
#import "BGOSecondViewController.h"
#import "BGOFourthViewController.h"
#import "BGOThirdViewController.h"

@interface BGOUnwindSeguesTests : XCTestCase

@property BGOFirstViewController *firstViewController;
@property BGOSecondViewController *secondViewController;
@property BGOThirdViewController *thirdViewController;
@property BGOFourthViewController *fourthViewController;

@end

@implementation BGOUnwindSeguesTests

- (void)setUp
{
    [super setUp];
    self.firstViewController = [[BGOFirstViewController alloc]init];
    self.secondViewController = [[BGOSecondViewController alloc]init];
    self.thirdViewController = [[BGOThirdViewController alloc]init];
    self.fourthViewController = [[BGOFourthViewController alloc]init];
}

- (void)tearDown
{
    self.firstViewController = nil;
    self.secondViewController = nil;
    self.thirdViewController = nil;
    self.fourthViewController = nil;
    [super tearDown];
}

- (void)testFirstViewController
{
    XCTAssert([self.firstViewController respondsToSelector:@selector(unwindToTheFirstView:)], @"Must have the selector to unwind back");
    XCTAssert([self.firstViewController respondsToSelector:@selector(presentView:)], @"Must have the selector to present required Vire");
    objc_property_t propertyTitle = class_getProperty([self.firstViewController class], "title");
    XCTAssert(propertyTitle != NULL, @"The view must have a title");
    [self.firstViewController viewDidLoad];
    NSString *title = @"First View Controller";
    XCTAssert([self.firstViewController.title isEqualToString:title], @"title must be equal to [First View Controller]");
}

- (void)testSecondViewController
{
    XCTAssert([self.secondViewController respondsToSelector:@selector(presentView:)], @"Must have the selector to present required Vire");
    objc_property_t propertyTitle = class_getProperty([self.secondViewController class], "title");
    XCTAssert(propertyTitle != NULL, @"The view must have a title");
    [self.secondViewController viewDidLoad];
    NSString *title = @"Second View Controller";
    XCTAssert([self.secondViewController.title isEqualToString:title], @"title must be equal to [First View Controller]");
}


- (void)testThirdViewController
{
    XCTAssert([self.thirdViewController respondsToSelector:@selector(presentFourthView:)], @"Must be able to present the fourth view controller in the second storyBoard");
    [self.thirdViewController presentFourthView:nil];
    XCTAssert(self.thirdViewController.fourthViewPresented, @"Must be able to perform the segue to the fourth view controller");
}

- (void)testFourthViewController
{
    XCTAssert([self.fourthViewController respondsToSelector:@selector(presentFirstView:)], @"Must be able to present the first view");
    objc_property_t propertyPresentingViewController = class_getProperty([self.fourthViewController class], "presentingViewController");
    XCTAssert(propertyPresentingViewController != NULL, @"Must have a presenting view controller");
}

@end
