//
//  PlaceViewController.m
//  Flight-Tickets
//
//  Created by Yuriy Fedyunkin on 25.07.2021.
//

#import "PlaceViewController.h"
#import "NSString+Localize.h"
#define cellIdentifier @"CellIdentifier"

@interface PlaceViewController ()

@property (nonatomic) PlaceType placeType;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) NSArray *currentArray;
@property (nonatomic, strong) NSArray *searchArray;
@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation PlaceViewController

- (instancetype)initWithType:(PlaceType)type {
    self = [super init];
    if (self) {
        _placeType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void) setupViews {
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.largeTitleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor]};
    self.view.backgroundColor = UIColor.systemTealColor;
    
    if (_placeType == PlaceTypeDeparture) {
        self.title = [@"place_from" localize];
    } else {
        self.title = [@"place_to" localize];
    }
    
    _segmentedControl = [[UISegmentedControl alloc] initWithItems:@[[@"place_cities" localize], [@"place_airports" localize]]];
    [_segmentedControl addTarget:self action:@selector(changeSource) forControlEvents:UIControlEventValueChanged];
    _segmentedControl.tintColor = [UIColor blackColor];
    self.navigationItem.titleView = _segmentedControl;
    _segmentedControl.selectedSegmentIndex = 0;
    [self changeSource];
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchBar.barTintColor = UIColor.systemTealColor;
    _searchController.obscuresBackgroundDuringPresentation = NO;
    _searchController.searchResultsUpdater = self;
    _searchArray = [NSArray new];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor = UIColor.clearColor;
    _tableView.tableHeaderView = _searchController.searchBar;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)changeSource {
    switch (_segmentedControl.selectedSegmentIndex) {
        case 0:
            _currentArray = [[DataManager sharedInstance] cities];
            break;
        case 1:
            _currentArray = [[DataManager sharedInstance] airports];
            break;
        default:
            break;
    }
    [self.tableView reloadData];
}

// MARK:  - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_searchController.isActive && [_searchArray count] > 0) {
        return [_searchArray count];
    }
    return [_currentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.backgroundColor = UIColor.clearColor;
        cell.textLabel.textColor = UIColor.blackColor;
        cell.detailTextLabel.textColor = UIColor.blackColor;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (_segmentedControl.selectedSegmentIndex == 0) {
        City *city = (_searchController.isActive && [_searchArray count] > 0) ? [_searchArray objectAtIndex:indexPath.row] : [_currentArray objectAtIndex:indexPath.row];
        cell.textLabel.text = city.name;
        cell.detailTextLabel.text = city.code;
    }
    else if (_segmentedControl.selectedSegmentIndex == 1) {
        Airport *airport = (_searchController.isActive && [_searchArray count] > 0) ? [_searchArray objectAtIndex:indexPath.row] : [_currentArray objectAtIndex:indexPath.row];
        cell.textLabel.text = airport.name;
        cell.detailTextLabel.text = airport.code;
    }
    
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DataSourceType dataType = ((int)_segmentedControl.selectedSegmentIndex) + 1;
    if (_searchController.isActive && [_searchArray count] > 0) {
        [self.delegate selectPlace:[_searchArray objectAtIndex:indexPath.row] withType:_placeType andDataType:dataType];
        _searchController.active = NO;
    } else {
        [self.delegate selectPlace:[_currentArray objectAtIndex:indexPath.row] withType:_placeType andDataType:dataType];
    }
    [self.navigationController popViewControllerAnimated:YES];
}


// MARK: - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    if (searchController.searchBar.text) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name CONTAINS[cd] %@", searchController.searchBar.text];
        _searchArray = [_currentArray filteredArrayUsingPredicate: predicate];
        [_tableView reloadData];
    }
}

@end
