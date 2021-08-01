//
//  LocationService.h
//  Flight-Tickets
//
//  Created by Yuriy Fedyunkin on 01.08.2021.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#define kLocationServiceDidUpdateCurrentLocation @"LocationServiceDidUpdateCurrentLocation"

NS_ASSUME_NONNULL_BEGIN

@interface LocationService : NSObject

@end

NS_ASSUME_NONNULL_END
