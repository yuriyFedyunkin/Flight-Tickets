//
//  TicketTableViewCell.h
//  Flight-Tickets
//
//  Created by Yuriy Fedyunkin on 27.07.2021.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"
#import "APIManager.h"
#import "FavoriteTicket+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface TicketTableViewCell : UITableViewCell

@property (nonatomic, strong) Ticket *ticket;
@property (nonatomic, strong) FavoriteTicket *favoriteTicket;
@property (nonatomic, strong) UIImageView *airlineLogoView;

@end

NS_ASSUME_NONNULL_END
