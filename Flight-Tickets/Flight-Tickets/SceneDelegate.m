//
//  SceneDelegate.m
//  Flight-Tickets
//
//  Created by Yuriy Fedyunkin on 19.07.2021.
//

#import "SceneDelegate.h"
#import "MainViewController.h"
#import "MapViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    CGRect windowFrame = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame:windowFrame];
    [self.window makeKeyAndVisible];
    //MainViewController *firstController = [[MainViewController alloc] init];
    
    MapViewController *firstController = [[MapViewController alloc] init];
    
    UINavigationController *myNavigationController = [[UINavigationController alloc] initWithRootViewController:firstController];
    
    self.window.rootViewController = myNavigationController;
    // firstController.view.backgroundColor = [UIColor greenColor];
    
    UIWindowScene *windowScene = (UIWindowScene*)scene;
    [self.window setWindowScene:windowScene];
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
