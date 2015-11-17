//
//  TestViewController.m
//  test
//
//  Created by Zuyang Kou on 11/17/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "TestViewController.h"
#import "RCTRootView.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView {
  [super loadView];

  NSURL *jsCodeLocation;

  /**
   * Loading JavaScript code - uncomment the one you want.
   *
   * OPTION 1
   * Load from development server. Start the server from the repository root:
   *
   * $ npm start
   *
   * To run on device, change `localhost` to the IP address of your computer
   * (you can get this by typing `ifconfig` into the terminal and selecting the
   * `inet` value under `en0:`) and make sure your computer and iOS device are
   * on the same Wi-Fi network.
   */

  jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios&dev=true"];

  /**
   * OPTION 2
   * Load from pre-bundled file on disk. The static bundle is automatically
   * generated by "Bundle React Native code and images" build step.
   */

  //   jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];

  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"test"
                                               initialProperties:nil
                                                   launchOptions:nil];
  rootView.frame = CGRectMake(0, 66, 200, 300);
  [self.view addSubview:rootView];
  self.view.backgroundColor = [UIColor whiteColor];

  UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(300, 300, 88, 88)];
  [button setTitle:@"push" forState:UIControlStateNormal];
  button.backgroundColor = [UIColor redColor];
  [button addTarget:self action:@selector(pushViewController:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];

  dispatch_async(dispatch_get_main_queue(), ^{
    // expensive UI-related work
    sleep(1);
  });
}

- (IBAction)pushViewController:(id)sender {
  UIViewController *viewController = [[UIViewController alloc] init];
  viewController.view.backgroundColor = [UIColor whiteColor];
  [self.navigationController pushViewController:viewController animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
