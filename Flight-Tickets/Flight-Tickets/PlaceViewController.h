//
//  PlaceViewController.h
//  Flight-Tickets
//
//  Created by Yuriy Fedyunkin on 25.07.2021.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"

typedef enum PlaceType {
    PlaceTypeArrival,
    PlaceTypeDeparture
} PlaceType;

@protocol PlaceViewControllerDelegate <NSObject>
- (void)selectPlace:(id _Nullable )place withType:(PlaceType)placeType andDataType:(DataSourceType)dataType;
@end

NS_ASSUME_NONNULL_BEGIN

@interface PlaceViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) id<PlaceViewControllerDelegate>delegate;
- (instancetype)initWithType:(PlaceType)type;

@end

NS_ASSUME_NONNULL_END
