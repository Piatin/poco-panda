//
//  ExpViewController.h
//  game
//
//  Created by Kako on 2014/08/27.
//  Copyright (c) 2014年 Kako. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ExpViewController : UIViewController<UIScrollViewDelegate> {
    UIScrollView *scrollView;
    UIPageControl *pageControl;
    UIImageView *imgView;
    UIImageView *imgView2;
    UIImageView *imgView3;
    UIImage *imgArray[3];
    int i;
    
    
}

@end



