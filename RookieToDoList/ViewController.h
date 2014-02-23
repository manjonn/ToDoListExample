//
//  ViewController.h
//  RookieToDoList
//
//  Created by Manjula Jonnalagadda on 2/22/14.
//  Copyright (c) 2014 Manjula Jonnalagadda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddToDoItemViewController.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate, AddToDoItemViewControllerDelegate>


@property(nonatomic,strong)NSMutableArray *toDoItems;

@property (weak, nonatomic) IBOutlet UITableView *toDoTableView;

@end
