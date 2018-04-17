//
//  ViewController.m
//  粒子效果
//
//  Created by Sdr on 2018/4/16.
//  Copyright © 2018年 com.msxf. All rights reserved.
//

#import "ViewController.h"
#import "VCView.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet VCView *vcView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)start:(id)sender {
  
  [self.vcView start];
}

- (IBAction)repeat:(id)sender {
  [self.vcView reDraw];

}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
