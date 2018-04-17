//
//  VCView.m
//  粒子效果
//
//  Created by Sdr on 2018/4/16.
//  Copyright © 2018年 com.msxf. All rights reserved.
//

#import "VCView.h"

@interface VCView ()

@property(nonatomic, strong) UIBezierPath *path ;
@property(nonatomic, strong) CALayer *dotLayer;

@end

@implementation VCView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
+(Class)layerClass{
  
  return [CAReplicatorLayer class];
}
- (void)drawRect:(CGRect)rect {
    // Drawing code
   [self.path stroke];
  
}

- (void)pan:(UIPanGestureRecognizer *)pan {
  
  CGPoint curP = [pan locationInView:self];
  if (pan.state == UIGestureRecognizerStateBegan) {
    
    [self.path moveToPoint:curP];
    
  } else if (pan.state == UIGestureRecognizerStateChanged){
    [self.path addLineToPoint:curP];
    [self setNeedsDisplay];
    
  }
}

- (void)awakeFromNib{
  
  UIPanGestureRecognizer *pan =  [[UIPanGestureRecognizer  alloc]initWithTarget:self action:@selector(pan:)];
   [self addGestureRecognizer:pan];
   //创建路径
   UIBezierPath *path = [UIBezierPath bezierPath];
   self.path = path;
  
  //创建粒子
  CALayer *dotLayer = [CALayer layer];
  dotLayer.frame = CGRectMake(-10, 0, 10, 10);
 
  self.dotLayer = dotLayer;
  [self.layer addSublayer:dotLayer];
  
  CAReplicatorLayer *repL = (CAReplicatorLayer *)[self layer];
  repL.instanceCount = 30;
  repL.instanceDelay = 1;
  
}

- (void)reDraw{
  //把路径清空
  
  [self.path removeAllPoints];
  [self setNeedsDisplay];
  //移除动画
  [self.dotLayer removeAllAnimations];
  
}
- (void)start{
  //添加动画
  CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
  anim.keyPath = @"position";
  anim.path = self.path.CGPath;
  anim.repeatCount = MAXFLOAT;
  anim.duration = 4;
  CGFloat  red = arc4random()%256/255.0;
  CGFloat green = arc4random()%256/255.0;
  CGFloat blue = arc4random()%256/255.0;
  self.dotLayer.backgroundColor =[UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;
  [self.dotLayer addAnimation:anim forKey:nil];
  
  
}

@end
