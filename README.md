
# CICKit

![Build Status](https://travis-ci.org/CodeInventorGroup/CICKit.svg?branch=master)
![Platform](https://img.shields.io/cocoapods/p/CICKit.svg?style=flat)
![CocoaPods Compatible](https://img.shields.io/cocoapods/v/CICKit.svg?style=flat)
![Pod License](https://img.shields.io/cocoapods/l/CICKit.svg)

`CIComponentKit` 是一个由 `ManoBoo` & `NEWWORLD` 支持和维护的基础组件库，里面包含了一些基础库 `UIKit` 和 `UIFoundation` 的 `Categories` ，通过使用链式写法，添加前缀 `cic.` 可快速设置组件属性创建视图，也包含了一些常用视图组件的封装。

当前 `CICKit` 支持 `Objective-C` 语言，如使用 `Swift` 语言，使用 **[CIComponentKit](https://github.com/CodeInventorGroup/CIComponentKit)** 更方便。

- [x] Categories for `UIImage`,`UIButton`,`UIImageView`,`UILabel`等
- [x] `CICNumberKeyboardView` 自定义10位数字键盘
- [x] `CICVerifyPayPasswordView` 类似微信的密码输入框
- [x] `CICTabBarController` 支持动态更新tabbar图片、文字、背景及颜色
- [ ] 后续更多便捷功能正在开发中...

## Installation with CocoaPods

添加下面指定内容到自己的Podfile文件中

```ruby
platfor: ios, '8.0'

target 'TargetName' do
  pod 'CICKit', '~> 0.0.3.4'
end
```

打开终端，在项目路径下，执行下面的命令

```bash
$ pod install

Pod installation complete! There is 1 dependency from the Podfile and 2 total pods installed.
```

## Usage

### CICTabBarController

`CICTabBarController` 可快速创建app框架

- 首先必须传递 `TabbarController` 对应的类名数组 `classNameData` ，不需要引入类所对应的 `.h` 文件
- `imageSize` 设置显示图片的大小，在更新图片数据之前设置
- `selectedTextColor` 设置 `TabbarItem` 文字选中的颜色，`normalTextColor` 设置 `TabbarItem` 文字未选中的颜色 (设置的颜色未修改 `[UITabBarItem appearance]`，不会引起全局 `TabbarItem` 颜色变化)
- 几种方式更新 `Tabbar` 数据：包含图片名称或者url链接，按照展示的顺序排列，未选中 `TabbarItem` 时系统会根据数组里的图片，自动生成相应的模板图片显示，选中时显示数组内的图片；初始显示标题的 `Tabbar` 动态不显示标题时，数据数组内标题可传 `@""`

  - 只更新图片 `itemDataNormalImage`

    ```objective-c
    @[@"home_tabbar_icon", @"home_tabbar_icon", @"tool_tabbar_icon"]
    ```

  - 更新图片和文字 `itemDataTitleNormalImage`

    ```objective-c
    @[@[@"首页", @"home_tabbar_icon"],
      @[@"聚中", @"center_tabbar_icon"],
      @[@"工具", @"tool_tabbar_icon"]]
    ```
  
  - 更新未选中的图片和选中的图片 `itemDataNormalSelectedImage`
  - 更新标题、未选中的图片和选中的图片 `itemDataTitleNormalSelectedImage`

- `badgeValue` 设置 `TabbarItem` 角标，两个参数：`TabbarItem` 位置 和 显示的内容

#### 快速创建TabbarController

```objective-c
CICTabbarController *tabbarController = [[CICTabbarController alloc] init];
//  首先设置类名数据
tabbarController.cic
.classNameData(@[@"ViewController", @"ViewController", @"ViewController"])
.itemDataTitleNormalImage(@[@[@"首页", @"home_tabbar_icon"],
                            @[@"聚中", @"center_tabbar_icon"],
                            @[@"工具", @"tool_tabbar_icon"]])
.selectedTextColor([UIColor cic_hexColor:0x1296db])
.normalTextColor([UIColor cic_hexColor:0x646464])
.badgeValue(2, @"100");
self.window.rootViewController = tabbarController;

//  动态加载tabbar图片的数据
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        NSArray *urls = [NSArray array];
    //        tabbarController.cic.itemDataNormalSelectedImage(urls).barBackgroundImage(@"");
    tabbarController.cic.imageSize(CGSizeMake(34, 34))
    .itemDataTitleNormalImage(@[@[@"",@"home_tabbar_icon"],
                                @[@"",@"center_tabbar_icon"],
                                @[@"",@"tool_tabbar_icon"]]);
    tabbarController.didSelectedTabbarBlock = ^(NSInteger selectedIndex) {
        NSLog(@"selectedIndex = %ld", selectedIndex);
    };
});
```

### CICNumberKeyboardView

`CICNumberKeyboardView` 是一个展示10位数字的键盘视图，支持顺序数字 `CICKeyboardTypeNumber` 排列和随机数字 `CICKeyboardTypeRandomNumber` 两种。

- 获取0-9随机不重复的数组 `numberData`：初始化一个存储顺序数字的数组 `tempArray`，生成包含所有下标的随机数字，根据下标取数组中的元素加入数组 `numberData` ，`tempArray` 将该元素移除；重复前面的过程，直至 `tempArray` 的元素个数为0后，`numberData`已存储了无序的0-9数字。

- 根据键盘输入的数值 `value` 是否为 `nil` 确认，该键为数字键或者删除键。

#### 使用数字键盘 (默认不设置键盘总高度)

```objective-c
CICNumberKeyboardView *keyboardView = [CICNumberKeyboardView keyboardViewWithType:CICKeyboardTypeNumber];

__weak  typeof(self) weakSelf = self;
keyboardView.clickKeyboardButtonBlock = ^(NSString * _Nonnull value) {
    [weakSelf handleKeyboardInputValue:value];
};
```

#### 设置键盘高度

```objective-c
CICNumberKeyboardView *keyboardView = [CICNumberKeyboardView keyboardViewWithType:CICKeyboardTypeRandomNumber keyboardHeight:200];
```

### CICVerifyPayPasswordView

`CICVerifyPayPasswordView` 是一个类似微信的密码输入框，使用上述的 `CICNumberKeyboardView` 数字键盘(默认随机数字样式)。

- 该输入框中，显示键盘输入内容的每个小黑点是一张图片，通过键盘的输入和删除，控制每个小黑点的展示和隐藏
- 该输入框中不包含 `TextField` ，不支持粘贴密码。

#### 展示 密码输入框

```objective-c
CGFloat width = 300;
CICVerifyPayPasswordView *verifyPasswordView = [CICVerifyPayPasswordView verifyPayPasswordViewWithFrame:CGRectMake((CIC_SCREEN_WIDTH - width)/2.0, 200, width, 50) showKeyboardBottomHeight:CIC_TAB_BAR_HEIGHT keyboardHeight:0 keyboardType:CICKeyboardTypeRandomNumber verifyPayPasswordBlock:^(NSString * _Nonnull password) {

}];
[verifyPasswordView cic_addTo:self.view];
```

## License

CICKit is released under the MIT license. See [LICENSE](https://github.com/CodeInventorGroup/CICKit/blob/master/LICENSE) for details.
