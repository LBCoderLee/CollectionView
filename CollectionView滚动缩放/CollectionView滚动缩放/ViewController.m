//
//  ViewController.m
//  CollectionView滚动缩放
//
//  Created by li  bo on 16/5/30.
//  Copyright © 2016年 li  bo. All rights reserved.
//

#import "ViewController.h"
#import "LBLineLayout.h"
#import "LBPhotocCell.h"


@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation ViewController

static NSString * const LBPhoto = @"kobe";

- (void)viewDidLoad {
    [super viewDidLoad];

    // 创建布局
    LBLineLayout *layout = [[LBLineLayout alloc] init];
    layout.itemSize = CGSizeMake(150, 150);

    // 创建collectionView
    CGFloat collectionW = self.view.frame.size.width;
    CGFloat collectionH = self.view.frame.size.height;
    CGRect frame = CGRectMake(0, 0, collectionW , collectionH);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:collectionView];

    // 注册cell,我这里是使用的xib
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([LBPhotocCell class]) bundle:nil] forCellWithReuseIdentifier:LBPhoto];
    
}
#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (BOOL)prefersStatusBarHidden
{

    return YES;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //创建cell
    LBPhotocCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LBPhoto forIndexPath:indexPath];
    //重写imageName的set方法，内部其实就是给cell的imageView赋值(imageView是我们自己给cell添加的子控件)
    cell.imageName = [NSString stringWithFormat:@"Snip20160515_%zd", indexPath.item + 69];
    return cell;
}




@end
