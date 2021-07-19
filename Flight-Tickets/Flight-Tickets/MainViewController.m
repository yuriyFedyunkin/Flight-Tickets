//
//  MainViewController.m
//  Flight-Tickets
//
//  Created by Yuriy Fedyunkin on 19.07.2021.
//

#import "MainViewController.h"
#import "DataManager.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.systemTealColor;
    [self configureLoadButton];
}

- (void)configureLoadButton {
    UIButton *loadButton = [[UIButton alloc] initWithFrame:
                            CGRectMake(self.view.frame.size.width / 3,
                                       self.view.frame.size.height / 2,
                                       self.view.frame.size.width / 3,
                                       44)];
    loadButton.layer.masksToBounds = true;
    loadButton.layer.cornerRadius = loadButton.frame.size.height / 2;
    loadButton.backgroundColor = UIColor.darkGrayColor;
    loadButton.tintColor = UIColor.whiteColor;
    [loadButton setTitle:@"Load data" forState:normal];
    [loadButton addTarget:self action:@selector(loadFlightsDataFromJSON) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loadButton];
}

-(void) loadFlightsDataFromJSON {
    [[DataManager sharedInstance] loadData];
    self.view.backgroundColor = UIColor.cyanColor;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadDidComplete) name:kDataManagerLoadDataDidComplete object:nil];
}

- (void) loadDidComplete {
    self.view.backgroundColor = UIColor.greenColor;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
