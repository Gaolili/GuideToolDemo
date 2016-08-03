//
//  LoopView.m
//  LearnDemo
//
//  Created by gaolili on 16/8/2.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "LoopView.h"

@interface LoopView ()
@property (nonatomic,strong)NSMutableArray * imageArra;
@property (nonatomic,strong)NSTimer * timer;
@property (nonatomic,strong)UIPageControl * pageControl;
@property (nonatomic,assign)NSInteger count;

@end

@implementation LoopView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSArray * img = [NSArray arrayWithObjects:@"test3",@"test2",@"test1", nil];
        _imageArra = [NSMutableArray array];
        
        for (NSString * str in img ) {
            UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:str]];
            imageView.frame = CGRectMake(0, 0,self.bounds.size.width , self.bounds.size.height);
            [self addSubview:imageView];
            [_imageArra addObject:imageView];
        }
        
        self.pageControl.numberOfPages = _imageArra.count;
        [self addSubview:self.pageControl];
        
    }
    return self;
}


- (void)starAnimation{
   _timer = [NSTimer timerWithTimeInterval:1.5 target:self selector:@selector(moveAnimation) userInfo:nil repeats:YES];
   [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
}

- (void)moveAnimation{
    
     UIImageView * firstImg = _imageArra.firstObject;
     [UIView animateWithDuration:1.5 animations:^{
        firstImg.transform = CGAffineTransformMakeTranslation(-self.bounds.size.width, 0);
     } completion:^(BOOL finished) {
        [self sendSubviewToBack:firstImg];
         firstImg.transform = CGAffineTransformIdentity;
        [_imageArra removeObject:firstImg];
        [_imageArra insertObject:firstImg atIndex:2];
     }];
    
    ++ _count ;
    if (_count == _imageArra.count ) {
        _count = 0;
    }
    self.pageControl.currentPage = _count;
    
    
}

- (void)complateAnimation{
    [_timer invalidate];
     _timer = nil;
}

- (UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 30, self.bounds.size.width, 30)];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.currentPage = 0;
     }
    return _pageControl;
}

@end
