//
//  AddToDoItemViewController.m
//  RookieToDoList
//
//  Created by Manjula Jonnalagadda on 2/22/14.
//  Copyright (c) 2014 Manjula Jonnalagadda. All rights reserved.
//

#import "AddToDoItemViewController.h"
#import "ToDoItem.h"

@interface AddToDoItemViewController (){
    
    NSDateFormatter *dateFormat;
    
}


@end

@implementation AddToDoItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    dateFormat=[NSDateFormatter new];
    [dateFormat setDateFormat:@"dd-MMM-YYYY hh:mm:ss a"];
    self.dateToolbar.hidden=YES;
    self.datePicker.hidden=YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dateTapped:(id)sender {
    
    self.dateToolbar.hidden=NO;
    self.datePicker.hidden=NO;

    
}

- (IBAction)datePicked:(UIBarButtonItem *)sender {
    
    self.dateToolbar.hidden=YES;
    self.datePicker.hidden=YES;
    
    [self.dateButton setTitle:[dateFormat stringFromDate:self.datePicker.date] forState:UIControlStateNormal];
    

}

- (IBAction)datePickingCancelled:(id)sender {
    
    self.dateToolbar.hidden=YES;
    self.datePicker.hidden=YES;

}

- (IBAction)save:(UIBarButtonItem *)sender {
    
    ToDoItem *toDoItem=[[ToDoItem alloc]init];
    toDoItem.item=self.itemTextFld.text;
    toDoItem.date=self.datePicker.date;
    
    if ([self.delegate respondsToSelector:@selector(itemAdded:)]) {
        [self.delegate itemAdded:toDoItem];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
