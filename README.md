![image](https://github.com/xhzengAIB/LearnEnglish/raw/master/Screenshots/XHTwitterPaggingViewer.gif)

TwitterPaggingViewer
====================

A twitter like navigation bar, page viewer.


## 组件要求                                        Requirements

* iOS 6.0+ 
* ARC

## Podfile

[CocosPods](http://cocosPods.org) is the recommended method to install TwitterPaggingViewer, just add the following line to `Podfile`

```
pod 'XHTwitterPaggingViewer'
```

and run `pod install`, then you're all done!


## How to use
Easy to drop into your project.                                
```objc

XHTwitterPaggingViewer *twitterPaggingViewer = [[XHTwitterPaggingViewer alloc] init];
    
    
NSMutableArray *viewControllers = [[NSMutableArray alloc] initWithCapacity:7];
    
NSArray *titles = @[@"Home", @"Friend", @"曾宪华", @"News", @"Viewer", @"Framework", @"Pagging"];

[titles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL *stop) {
    XHTableViewController *tableViewController = [[XHTableViewController alloc] init];
    tableViewController.title = title;
    [viewControllers addObject:tableViewController];
}];
    
    
twitterPaggingViewer.viewControllers = viewControllers;

twitterPaggingViewer.didChangedPageCompleted = ^(NSInteger cuurentPage, NSString *title) {
    NSLog(@"cuurentPage : %ld on title : %@", (long)cuurentPage, title);
};
    
self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:twitterPaggingViewer];


```

## License

中文: TwitterPaggingViewer 是在MIT协议下使用的，可以在LICENSE文件里面找到相关的使用协议信息。

English: TwitterPaggingViewer is available under the MIT license, see the LICENSE file for more information.     
