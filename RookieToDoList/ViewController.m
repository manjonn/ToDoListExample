//
//  ViewController.m
//  RookieToDoList
//
//  Created by Manjula Jonnalagadda on 2/22/14.
//  Copyright (c) 2014 Manjula Jonnalagadda. All rights reserved.
//

#import "ViewController.h"
#import "ToDoItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.toDoItems=[NSMutableArray array];
    
    /*
    ToDoItem *toDoItem1=[[ToDoItem alloc]init];
    toDoItem1.item=@"Beaux Job";
    toDoItem1.date=[NSDate date];
    
    ToDoItem *toDoItem2=[[ToDoItem alloc]init];
    toDoItem2.item=@"Beaux's Kitchen";
    toDoItem2.date=[NSDate date];
    
    NSDateFormatter *dateFormat;
    
    
   */

    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    AddToDoItemViewController *addItemViewController=segue.destinationViewController;
    addItemViewController.delegate=self;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDatasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.toDoItems count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell.
 //   cell.textLabel.text = [self.colorNames objectAtIndex: [indexPath row]];
    ToDoItem *toDoItem=self.toDoItems[indexPath.row];
    cell.textLabel.text=toDoItem.item;
    
    return cell;
}

#pragma mark AddItemViewController

-(void)itemAdded:(ToDoItem *)toDoItem{
    
    [self.toDoItems addObject:toDoItem];
     [self.toDoTableView reloadData];
    
}

@end
