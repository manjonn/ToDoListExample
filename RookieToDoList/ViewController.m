//
//  ViewController.m
//  RookieToDoList
//
//  Created by Manjula Jonnalagadda on 2/22/14.
//  Copyright (c) 2014 Manjula Jonnalagadda. All rights reserved.
//

#import "ViewController.h"
#import "MapViewController.h"
#import "ToDoItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.toDoItems=[NSMutableArray array];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addItem:) name:@"todoItemCreated" object:nil];
    
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

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    //Uncomment for delegate pattern
    
    /*
    
    AddToDoItemViewController *addItemViewController=segue.destinationViewController;
    addItemViewController.delegate=self;
     */
    
    
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell.
 //   cell.textLabel.text = [self.colorNames objectAtIndex: [indexPath row]];
    ToDoItem *toDoItem=self.toDoItems[indexPath.row];
    cell.textLabel.text=toDoItem.item;
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@ %@, %@,%@",toDoItem.placemark.subThoroughfare, toDoItem.placemark.thoroughfare,toDoItem.placemark.locality,toDoItem.placemark.administrativeArea];

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ToDoItem *toDoItem=self.toDoItems[indexPath.row];
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main"
                                                  bundle:nil];
    MapViewController* mapViewController = [sb instantiateViewControllerWithIdentifier:@"MapViewController"];
//    MapViewController *mapViewController=[[MapViewController alloc]init];
    [self.navigationController pushViewController:mapViewController animated:YES];
    
    mapViewController.placemark=toDoItem.placemark;
    
    mapViewController.showOnly=YES;
    
    
}

#pragma mark AddItemViewController

-(void)itemAdded:(ToDoItem *)toDoItem{
    
    //Uncomment for Delegate pattern
    
  /*
    [self.toDoItems addObject:toDoItem];
     [self.toDoTableView reloadData];
   */
    
}

-(void)addItem:(NSNotification *)notification{
    
    ToDoItem *toDoItem=[notification userInfo][@"todoitem"];
    
    [self.toDoItems addObject:toDoItem];
    [self.toDoTableView reloadData];
    
    
}

@end
