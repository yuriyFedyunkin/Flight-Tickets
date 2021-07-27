//
//  TicketTableViewCell.h
//  Flight-Tickets
//
//  Created by Yuriy Fedyunkin on 27.07.2021.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"
#import "APIManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface TicketTableViewCell : UITableViewCell

@property (nonatomic, strong) Ticket *ticket;

@end

NS_ASSUME_NONNULL_END
