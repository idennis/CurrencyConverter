//
//  AppDelegate.h
//  PeerReview3
//
//  Created by Dennis Hou on 20/8/17.
//  Copyright © 2017 dennis hou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

