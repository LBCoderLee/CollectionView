//
//  LBPhotocCell.m
//  CollectionView滚动缩放
//
//  Created by li  bo on 16/5/30.
//  Copyright © 2016年 li  bo. All rights reserved.
//

#import "LBPhotocCell.h"


@interface LBPhotocCell ()

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;


@end
@implementation LBPhotocCell

- (void)awakeFromNib {
    self.photoImageView.layer.borderColor = [UIColor blackColor].CGColor;
    self.photoImageView.layer.borderWidth = 10;
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = [imageName copy];

    self.photoImageView.image = [UIImage imageNamed:imageName];
}
@end
