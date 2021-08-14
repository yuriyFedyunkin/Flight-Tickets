//
//  NSString+Localize.m
//  Flight-Tickets
//
//  Created by Yuriy Fedyunkin on 13.08.2021.
//

#import "NSString+Localize.h"

@implementation NSString (Localize)

- (NSString *)localize {
return NSLocalizedString(self, "");
}

@end
