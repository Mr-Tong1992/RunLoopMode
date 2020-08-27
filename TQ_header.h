
#ifndef TQ_header_h
#define TQ_header_h


#import "TQRunLoopLisener.h"

static  NSString *  TQ_kCFRunLoopBeforeWaiting =  @"StartNetImage";


#endif /* TQ_header_h */



/*
 控制器中
 
 [TQRunLoopLisener   start];
 [[NSNotificationCenter defaultCenter] addObserverForName:@"StartNetImage" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
     for (int i = 0 ; i< self.dataSource.count; i++) {
         YjxCustomModel *model = self.dataSource[i];
         if (model.showImageBlock) {
             model.showImageBlock();
         }

     }
 }];
 
 
 
 CeLL 文件中
 __weak typeof(self) _weakSelf = self;
 [self  dealForImageViewWith:model.iconImg ImageView:_weakSelf.imageView];
 
 
 -(void)dealForImageViewWith:(NSString *)imageName ImageView:(UIImageView *)imageV{
     
     //如果内存或硬盘中有  直接拿出渲染
     SDImageCache * cache = [SDImageCache   sharedImageCache];
     UIImage * image =   [cache imageFromMemoryCacheForKey:imageName];
     if (!image) {
         [cache  imageFromDiskCacheForKey:imageName];
     }
     if (image) {
         self.iconImg.image = image;
     }
     _model.showImageBlock = ^{
        //内存中没有我们再 DefaultMode即将进入睡眠  进行图片的网络下载
         [imageV sd_setImageWithURL:[NSURL URLWithString:imageName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
             
         }];
     };
 }
 
 */
