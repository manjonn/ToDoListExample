//
//  AddToDoItemViewController.h
//  RookieToDoList
//
//  Created by Manjula Jonnalagadda on 2/22/14.
//  Copyright (c) 2014 Manjula Jonnalagadda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ToDoItem;

@protocol AddToDoItemViewControllerDelegate <NSObject>

-(void)itemAdded:(ToDoItem *)toDoItem;

@end

@interface AddToDoItemViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *itemTextFld;

@property (weak, nonatomic) IBOutlet UIButton *dateButton;
@property (weak, nonatomic) IBOutlet UIToolbar *dateToolbar;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak,nonatomic) id<AddToDoItemViewControllerDelegate> delegate;

- (IBAction)dateTapped:(id)sender;
- (IBAction)datePicked:(UIBarButtonItem *)sender;
- (IBAction)datePickingCancelled:(id)sender;

- (IBAction)save:(UIBarButtonItem *)sender;


@end
