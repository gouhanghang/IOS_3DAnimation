//
//  ViewController.m
//  3DRotating_GH
//
//  Created by 苟应航 on 2018/4/1.
//  Copyright © 2018年 GouHang. All rights reserved.
//
#define viewtop 60
#define viewbottom 260
#define viewwithd 70
#import "ViewController.h"

@interface ViewController ()<iCarouselDataSource, iCarouselDelegate>
{
    iCarousel *_icarousel;
}
@property (nonatomic, assign) BOOL wrap;
@end

@implementation ViewController

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *title=[UILabel new];
    title.text=@"我最喜欢的一个小姐姐";
    title.textColor=[UIColor blackColor];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.view.mas_top).mas_offset(SafeAreaTopHeight-35);
    }];
    
    UILabel *leanlabe=[UILabel new];
    leanlabe.backgroundColor=[UIColor grayColor];
    [self.view addSubview:leanlabe];
    [leanlabe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(SafeAreaTopHeight-1);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    _wrap = YES;
    _icarousel=[iCarousel new];
    _icarousel.userInteractionEnabled = YES;
    _icarousel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _icarousel.type = iCarouselTypeRotary;
    _icarousel.delegate = self;
    _icarousel.dataSource = self;
    [self.view addSubview:_icarousel];
    [_icarousel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(leanlabe.mas_bottom).mas_offset(2);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(SCREEN_HEIGHT-SafeAreaTopHeight-60);
    }];
}


#pragma mark iCarousel methods
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 5;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (index==0) {
        
        PicktureImage *oneview=[[PicktureImage alloc]initWithFrame:CGRectMake(0, viewtop, SCREEN_WIDTH-viewwithd, SCREEN_HEIGHT-viewbottom)];
        return oneview;
    }else if (index==1){
        PicktueImageTwo *oneview=[[PicktueImageTwo alloc]initWithFrame:CGRectMake(0, viewtop, SCREEN_WIDTH-viewwithd, SCREEN_HEIGHT-viewbottom)];
        
        return oneview;
    }else if (index==2){
        PicktueImageThree *oneview=[[PicktueImageThree alloc]initWithFrame:CGRectMake(0, viewtop, SCREEN_WIDTH-viewwithd, SCREEN_HEIGHT-viewbottom)];
        return oneview;
    }else if (index==3){
        PicktueImageFour *oneview=[[PicktueImageFour alloc]initWithFrame:CGRectMake(0, viewtop, SCREEN_WIDTH-viewwithd, SCREEN_HEIGHT-viewbottom)];
        return oneview;
    }else{
        PicktueImageFive *oneview=[[PicktueImageFive alloc]initWithFrame:CGRectMake(0, viewtop, SCREEN_WIDTH-viewwithd, SCREEN_HEIGHT-viewbottom)];
        
        return oneview;
    }
}

- (CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    //implement 'flip3D' style carousel
    transform = CATransform3DRotate(transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f); // (transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f)
    return CATransform3DTranslate(transform, 0.0f, 0.0f, offset * carousel.itemWidth);
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return _wrap;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value * 1.5f; //1.05
        }
        case iCarouselOptionFadeMax:
        {
            if (carousel.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 0.0f;
            }
            return value;
        }
        default:
        {
            return value;
        }
    }
}

-(void)uimage:(UIImageView *)image{
    
    image.layer.shadowColor = [UIColor blackColor].CGColor;
    image.layer.shadowOpacity = 0.2f;
    image.layer.shadowRadius = 4.f;
    //      myImageView.backgroundColor=kRedColor;
    image.layer.shadowOffset = CGSizeMake(0,0);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
