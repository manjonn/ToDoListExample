//
//  ToDoItem.h
//  RookieToDoList
//
//  Created by Manjula Jonnalagadda on 2/22/14.
//  Copyright (c) 2014 Manjula Jonnalagadda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface ToDoItem : NSObject

@property(nonatomic,strong)NSString *item;
@property(nonatomic,strong)NSDate *date;
@property(nonatomic,strong)CLPlacemark *placemark;

@end
