//
//  FYSimpleTableController.h
//  FYTools
//
//  Created by 方懿 on 2017/11/30.
//

#import <UIKit/UIKit.h>

@interface FYSimpleTableController : UIViewController

/**
 子类必须重写此方法

 @return 数组的每一个dictionary元素对应tableView的一个row,key为row的title,value对应点击该row调用的方法名称
 */
- (NSArray<NSDictionary *> *)tableItemDict;

@end
