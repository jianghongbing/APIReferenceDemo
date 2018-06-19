//
//  CollectionListTableViewController.m
//  PHChangeRequest
//
//  Created by jianghongbing on 2018/5/15.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//
#import "CollectionListTableViewController.h"
#import "PHPhotoLibrary+CheckAuthorizationStatus.h"
@interface CollectionListTableViewController ()
@property (nonatomic,strong) PHFetchResult<PHCollectionList *> *fetchResult;
@end

@implementation CollectionListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [PHPhotoLibrary checkAuthorizationStatus:^(PHAuthorizationStatus status) {
        if(status == PHAuthorizationStatusAuthorized) {
            [self loadCollectionList];
        } else{
            NSLog(@"没有权限访问相册,请到设置里面开启相册访问权限");
        }
    }];
}

- (void)loadCollectionList {
    self.fetchResult = [PHCollectionList fetchCollectionListsWithType:PHCollectionListTypeSmartFolder subtype:PHCollectionListSubtypeAny options:nil];
    [self.tableView reloadData];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fetchResult.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collectionListCell" forIndexPath:indexPath];
    PHCollectionList *list = self.fetchResult[indexPath.row];
    cell.textLabel.text = list.localizedTitle;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
