//
//  GalleryViewController.h
//  game
//
//  Created by Kako on 2014/08/29.
//  Copyright (c) 2014年 Kako. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface GalleryViewController : UIViewController<UIScrollViewDelegate> {
    
    UIScrollView *scrollView2;
    UIPageControl *pageControl2;
    UIImageView *imgView[10];
    int i;
    
    UILabel *label1;
    UILabel *label2;
    UILabel *label3;
    UILabel *label4;
    UILabel *label5;
    UILabel *label6;
    UILabel *label7;
    UILabel *label8;
    UILabel *label9;
    UILabel *label10;
    AVAudioPlayer *bgmGal ;
    
    UILabel *count1;
    UILabel *count2;
    UILabel *count3;
    UILabel *count4;
    UILabel *count5;
    UILabel *count6;
    UILabel *count7;
    UILabel *count8;
    UILabel *count9;
    UILabel *count10;
    
    int cardnum1;
    int cardnum2;
    int cardnum3;
    int cardnum4;
    int cardnum5;
    int cardnum6;
    int cardnum7;
    int cardnum8;
    int cardnum9;
    int cardnum10;
    

}

@end
