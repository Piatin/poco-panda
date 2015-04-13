//
//  stage1anime.m
//  game
//
//  Created by Kako on 2014/12/13.
//  Copyright (c) 2014年 Kako. All rights reserved.
//

#import "stage1anime.h"





@implementation stage1anime

-(instancetype)initWithSize:(CGSize)size{
    if (self=[super initWithSize:size]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            // iPhone
            if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
                CGSize result = [[UIScreen mainScreen] bounds].size;
                CGFloat scale = [UIScreen mainScreen].scale;
                result = CGSizeMake(result.width * scale, result.height * scale);
                
                if(result.height == 960){
                    // iPhone4 or 4S
                    NSLog(@"iphone 4, 4s imgview");
                    
                }
                if(result.height == 1136){
                    // iPhone5
                    NSLog(@"iphone 5 imgview");
                   
                    
                }
            }
            
        }
        
        
               //パンダ
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            // iPhone
            if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
                CGSize result = [[UIScreen mainScreen] bounds].size;
                CGFloat scale = [UIScreen mainScreen].scale;
                result = CGSizeMake(result.width * scale, result.height * scale);
        
                if(result.height == 960){
                    // iPhone4 or 4S
                    NSLog(@"iphone 4, 4s imgview");
                    sprite = [SKSpriteNode spriteNodeWithImageNamed:@"pa01"];
                    sprite.position=CGPointMake(-80, 85);
                    sprite.size=CGSizeMake(450,320);
                              [self addChild:sprite];
                              
                              
        
                }
                if(result.height == 1136){
                    // iPhone5
                    NSLog(@"iphone 5 imgview");
                    sprite = [SKSpriteNode spriteNodeWithImageNamed:@"pa01"];
                                             sprite.position=CGPointMake(-80, 140);
                                             sprite.size=CGSizeMake(450,320);
                    [self addChild:sprite];

                    //panda = [[SKView alloc] initWithFrame:CGRectMake(-80, 140, 450, 320)];
        
                }
            }
        
        }
        
        
        NSMutableArray *imageList = [NSMutableArray array];
        for (NSInteger i = 1; i < 68; i++) {
            NSString *imagePath = [NSString stringWithFormat:@"pa%02d.png", i];
            SKTexture *img = [SKTexture textureWithImageNamed:imagePath];
            [imageList addObject:img];
        
        
     
         
        SKAction *panda =[SKAction
                          animateWithTextures:imageList timePerFrame:0.3];
            
        SKAction *pandaAnime =[SKAction repeatActionForever:panda];
                              
        [sprite runAction:pandaAnime];
            
        }
    
                              }
    return self;
    
     }


@end
