//
//  PicktureImage.m
//  3DRotating_GH
//
//  Created by 苟应航 on 2018/4/2.
//  Copyright © 2018年 GouHang. All rights reserved.
//

#import "PicktureImage.h"

@implementation PicktureImage
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self loadpicktureimageUI];
        
    }
    return self;
}
-(void)loadpicktureimageUI{
    
    UIImageView *seletbtn=[UIImageView new];
    seletbtn.userInteractionEnabled=YES;
    seletbtn.contentMode=UIViewContentModeScaleAspectFill;
    UITapGestureRecognizer *taps = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageaction)];
    [seletbtn addGestureRecognizer:taps];
    [seletbtn sd_setImageWithURL:[NSURL URLWithString:@"https://wx1.sinaimg.cn/mw1024/a8c17941gy1ffqxrvcdwej20qo0qogpx.jpg"]];
    [self addSubview:seletbtn];
    [seletbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(200);
    }];
}
-(void)imageaction{
    PickTureController *vc=[PickTureController new];
    vc.indexpictrue=0;
    vc.picturearr=@[@"https://wx1.sinaimg.cn/mw1024/a8c17941gy1ffqxrvcdwej20qo0qogpx.jpg"];
    [self.viewController.navigationController pushViewController:vc animated:YES];
}

//获取view的controller
- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
@end
