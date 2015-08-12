//
//  ViewController.m
//  UICollect测试
//
//  Created by keyan on 15/7/30.
//  Copyright (c) 2015年 keyan. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       UICollectionViewFlowLayout * flow = [[UICollectionViewFlowLayout alloc] init];
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    flow.minimumInteritemSpacing = 0;
    flow.minimumLineSpacing = 10;
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flow];
    _collectionView.backgroundColor = [UIColor redColor];
//    [_collectionView setCollectionViewLayout:flow];
    _collectionView.delaysContentTouches = NO;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"channelcollectioncell"];
    [self.view addSubview:_collectionView];

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * string = @"channelcollectioncell";
    MyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:string forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.titleLabel.text = @"哈哈";
//    [cell.headImageButton sd_setImageWithURL:[NSURL URLWithString:item.channelIcon] forState:UIControlStateNormal placeholderImage:[UIImage imageWithContentsOfFile:@"icon-zhanwei.png"]];
//    cell.cellDelegate = self;
//    cell.channelId = item.channelDetailId;
//    cell.channelItem = item;
//    if(SCREENHEIGHT > 650){
//        cell.titleLabel.font = [UIFont systemFontOfSize:17];
//    }else{
//        cell.titleLabel.font = [UIFont systemFontOfSize:14];
//    }
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //CGFloat top   CGFloat left    CGFloat bottom  CGFloat right
    return UIEdgeInsetsMake(18, 10, 10, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row ==1) {
        return CGSizeMake(100, 40);
    }
    else
    {
        return CGSizeMake(30, 30);
    }
//    return CGSizeMake(100, 30);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

//- (void)clickItemButton:(NSString *)cellName channelDetailId:(NSString *)channelDetailId channelItem:(ChannelItem *) channelItem
//{
//    [self goToNextViewControllerWithChannelItem:channelItem];
//}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
