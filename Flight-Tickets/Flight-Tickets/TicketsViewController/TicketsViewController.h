//
//  TicketsViewController.h
//  Flight-Tickets
//
//  Created by Yuriy Fedyunkin on 27.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TicketsViewController : UITableViewController

- (instancetype)initWithTickets:(NSArray *)tickets;

@end

NS_ASSUME_NONNULL_END
