//
//  MainViewController.m
//  Flight-Tickets
//
//  Created by Yuriy Fedyunkin on 19.07.2021.
//

#import "MainViewController.h"
#import "DataManager.h"

@interface MainViewController ()<PlaceViewControllerDelegate>

@property (nonatomic, strong) UIButton *departureButton;
@property (nonatomic, strong) UIButton *arrivalButton;
@property (nonatomic) SearchRequest searchRequest;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[DataManager sharedInstance] loadData];
    
    [self setupViews];
}

- (void)setupViews {
    self.view.backgroundColor = UIColor.systemTealColor;
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationController.navigationBar.largeTitleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor]};
    self.title = @"Search";
    
    _departureButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_departureButton setTitle:@"From" forState: UIControlStateNormal];
    _departureButton.tintColor = [UIColor whiteColor];
    _departureButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    _departureButton.frame = CGRectMake(30.0, 140.0, [UIScreen mainScreen].bounds.size.width - 60.0, 60.0);
    _departureButton.backgroundColor = [UIColor darkGrayColor];
    _departureButton.layer.masksToBounds = true;
    _departureButton.layer.cornerRadius = _departureButton.frame.size.height / 2;
    [_departureButton addTarget:self action:@selector(placeButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_departureButton];
    
    _arrivalButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_arrivalButton setTitle:@"To" forState: UIControlStateNormal];
    _arrivalButton.tintColor = [UIColor whiteColor];
    _arrivalButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    _arrivalButton.frame = CGRectMake(30.0, CGRectGetMaxY(_departureButton.frame) + 20.0, [UIScreen mainScreen].bounds.size.width - 60.0, 60.0);
    _arrivalButton.backgroundColor = [UIColor darkGrayColor];
    _arrivalButton.layer.masksToBounds = true;
    _arrivalButton.layer.cornerRadius = _arrivalButton.frame.size.height / 2;
    [_arrivalButton addTarget:self action:@selector(placeButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_arrivalButton];
}

- (void)placeButtonDidTap:(UIButton *)sender {
    PlaceViewController *placeViewController;
    if ([sender isEqual:_departureButton]) {
        placeViewController = [[PlaceViewController alloc] initWithType: PlaceTypeDeparture];
    } else {
        placeViewController = [[PlaceViewController alloc] initWithType: PlaceTypeArrival];
    }
    placeViewController.delegate = self;
    [self.navigationController pushViewController: placeViewController animated:YES];
}

// MARK: - PlaceViewControllerDelegate

- (void)selectPlace:(id)place withType:(PlaceType)placeType andDataType:(DataSourceType)dataType {
    [self setPlace:place withDataType:dataType andPlaceType:placeType forButton: (placeType == PlaceTypeDeparture) ? _departureButton : _arrivalButton ];
}

- (void)setPlace:(id)place withDataType:(DataSourceType)dataType andPlaceType:(PlaceType)placeType forButton:(UIButton *)button {
    NSString *title;
    NSString *iata;
    if (dataType == DataSourceTypeCity) {
        City *city = (City *)place;
        title = city.name;
        iata = city.code;
    }
    else if (dataType == DataSourceTypeAirport) {
        Airport *airport = (Airport *)place;
        title = airport.name;
        iata = airport.cityCode;
    }
    if (placeType == PlaceTypeDeparture) {
        _searchRequest.origin = iata;
    } else {
        _searchRequest.destionation = iata;
    }
    [button setTitle: title forState: UIControlStateNormal];
}

@end
