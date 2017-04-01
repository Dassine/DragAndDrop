//
//  AppDelegate.h
//  DragAndDrop
//
//  Created by Lilia Dassine BELAID on 2017-03-31.
//  Copyright © 2017 Lilia Dassine BELAID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

