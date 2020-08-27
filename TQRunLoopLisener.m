
#import "TQRunLoopLisener.h"
#import "TQ_header.h"

@implementation TQRunLoopLisener

+(void)start{
    [TQRunLoopLisener  ObserverRunloopkCFRunLoopDeFaultModes];
}

+(void)ObserverRunloopkCFRunLoopDeFaultModes{
       CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
//        activity == kCFRunLoopBeforeWaiting ?
           switch (activity) {
               case kCFRunLoopEntry:
                   NSLog(@"DefaultMode即将进入runloop");
                   break;
               case kCFRunLoopBeforeTimers:
                   NSLog(@"DefaultMode即将处理timer事件");
                   break;
               case kCFRunLoopBeforeSources:
                   NSLog(@"DefaultMode即将处理source事件");
                   break;
               case kCFRunLoopBeforeWaiting:
                   NSLog(@"DefaultMode即将进入睡眠");
                   
                   [[NSNotificationCenter defaultCenter] postNotificationName:TQ_kCFRunLoopBeforeWaiting object:nil];
                   //触发任务队列
                   break;
               case kCFRunLoopAfterWaiting:
                   NSLog(@"DefaultMode被唤醒");
                   break;
               case kCFRunLoopExit:
                   NSLog(@"DefaultModerunloop退出");
                   break;
                   
               default:
                   break;
           }
       });
       
       CFRunLoopAddObserver(CFRunLoopGetCurrent(),observer, kCFRunLoopDefaultMode);
}
+(void)ObserverRunloopkkCFRunLoopCommonModes{
       CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
    
           switch (activity) {
               case kCFRunLoopEntry:
                   NSLog(@"kCFRunLoopCommonModes即将进入runloop");
                   break;
               case kCFRunLoopBeforeTimers:
                   NSLog(@"kCFRunLoopCommonModes即将处理timer事件");
                   break;
               case kCFRunLoopBeforeSources:
                   NSLog(@"kCFRunLoopCommonModes即将处理source事件");
                   break;
               case kCFRunLoopBeforeWaiting:
                   NSLog(@"kCFRunLoopCommonModes即将进入睡眠");
                   break;
               case kCFRunLoopAfterWaiting:
                   NSLog(@"kCFRunLoopCommonModes被唤醒");
                   break;
               case kCFRunLoopExit:
                   NSLog(@"kCFRunLoopCommonModes退出");
                   break;
                   
               default:
                   break;
           }
       });
//       GSEventReceiveRunLoopMode
       CFRunLoopAddObserver(CFRunLoopGetCurrent(),observer, (const struct __CFString *) kCFRunLoopCommonModes);
}
@end
