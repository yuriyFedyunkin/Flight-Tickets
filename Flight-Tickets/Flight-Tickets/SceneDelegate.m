//
//  SceneDelegate.m
//  Flight-Tickets
//
//  Created by Yuriy Fedyunkin on 19.07.2021.
//

#import "SceneDelegate.h"
#import "TabBarController.h"
#import "NotificationCenter.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    CGRect windowFrame = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame:windowFrame];
    [self.window makeKeyAndVisible];

    TabBarController *tabBarController = [TabBarController new];
    self.window.rootViewController = tabBarController;
    
    UIWindowScene *windowScene = (UIWindowScene*)scene;
    [self.window setWindowScene:windowScene];
    
    [[NotificationCenter sharedInstance] registerService];
}

- (void)sceneDidDisconnect:(UIScene *)scene {
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
}


- (void)sceneWillResignActive:(UIScene *)scene {
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
}


@end
