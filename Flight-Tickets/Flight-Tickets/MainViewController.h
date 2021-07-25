//
//  MainViewController.h
//  Flight-Tickets
//
//  Created by Yuriy Fedyunkin on 19.07.2021.
//

#import <UIKit/UIKit.h>
#import "PlaceViewController.h"

@interface MainViewController : UIViewController

typedef struct SearchRequest {
    __unsafe_unretained NSString *origin;
    __unsafe_unretained NSString *destionation;
    __unsafe_unretained NSDate *departDate;
    __unsafe_unretained NSDate *returnDate;
} SearchRequest;

@end

