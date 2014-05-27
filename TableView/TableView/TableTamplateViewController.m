//
//  TableTamplateViewController.m
//  TableView
//
//  Created by tiffany  on 2014/5/26.
//  Copyright (c) 2014年 appscomb. All rights reserved.
//

#import "TableTamplateViewController.h"

@interface TableTamplateViewController ()

@end

@implementation TableTamplateViewController
@synthesize tableview;
@synthesize dataSource;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.tableview=[[UITableView alloc]initWithFrame:CGRectMake(0,0.0f, 320,  self.view.frame.size.height)];
    self.tableview.delegate=self;
    self.tableview.dataSource = self;
    [self.tableview setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    
    
    
    self.dataSource = [[NSMutableArray alloc] init];
    
    
    
    // NSLog(@"self.parentlist %@",self.parentlist);
    
    for (int j=0; j<100; j++) {
      
        
        [self.dataSource  addObject:[[NSString alloc] initWithFormat:@"%d", j]];
    }
    
    [self.view addSubview:self.tableview];
    
    
    [self.tableview reloadData];
    
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    

    return  40.0f;
  
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return [self.dataSource count ];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    

    NSArray *list = [[self.dataSource objectAtIndex:indexPath.row] componentsSeparatedByString:@"."];
    
    
    cell.textLabel.text =[self.dataSource objectAtIndex:indexPath.row];
    if(list.count>1){
     [cell setIndentationLevel:[[list objectAtIndex:1] intValue]];
    
    
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"%@.%d",[list objectAtIndex:0],+[[list objectAtIndex:1] intValue]+1];
    }
    //cell.detailTextLabel.text=[self.dataSource objectAtIndex:indexPath.row];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
  
    int index=0;
    NSArray *list = [[self.dataSource objectAtIndex:indexPath.row] componentsSeparatedByString:@"."];
    if(list.count>1){
       
     index=[[list objectAtIndex:1] intValue];
    }
    //cel
    
    NSString *cellText = [[NSString alloc] initWithFormat:@"%@.%d", cell.textLabel.text,++index];
    [self.dataSource insertObject:cellText atIndex:index];
    
    NSArray *paths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:index  inSection:0]];
    [[self tableview] insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationTop];
}




@end
