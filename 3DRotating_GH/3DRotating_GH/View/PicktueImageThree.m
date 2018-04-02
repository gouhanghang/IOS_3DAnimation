//
//  PicktueImageThree.m
//  3DRotating_GH
//
//  Created by 苟应航 on 2018/4/2.
//  Copyright © 2018年 GouHang. All rights reserved.
//

#import "PicktueImageThree.h"

@implementation PicktueImageThree

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        
        UIImageView *seletbtn=[UIImageView new];
        seletbtn.userInteractionEnabled=YES;
        
        UITapGestureRecognizer *taps = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageaction)];
        [seletbtn addGestureRecognizer:taps];
        
        seletbtn.contentMode=UIViewContentModeScaleAspectFill;
        [seletbtn sd_setImageWithURL:[NSURL URLWithString:@"https://wx1.sinaimg.cn/mw690/a188a11bgy1fo7ryb6itwj20u010j4qp.jpg"]];
        [self addSubview:seletbtn];
        [seletbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.width.mas_equalTo(300);
            make.height.mas_equalTo(200);
        }];
    }
    return self;
}
-(void)imageaction{
    PickTureController *vc=[PickTureController new];
    vc.indexpictrue=0;
    vc.picturearr=@[@"https://wx1.sinaimg.cn/mw690/a188a11bgy1fo7ryb6itwj20u010j4qp.jpg"];
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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
