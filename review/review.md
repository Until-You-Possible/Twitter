# review tweet project

# 学到哪些？

```swift
1: 基本对swiftUI/swfit有进一步的认识
2: 熟悉xcode的基本操作
3: app的打包，发布
4: 整理细节如下
```

```swift
1: 掌握基本的布局(S/V/HStack) 代表不同的布局方式,结合Spacer()方法 (控件占位)
2: swiftUI常用控件 如下：
```

```swift
// **此项目中用到的一些swiftUI的组件**

// Text
// 显示一行或者多行只读的文本制图
// 设置相关的css样式(类似jq的链式调用)
HStack {
  Text("789")
      .font(.subheadline)
      .bold()
Text("Continue")
      .font(.headline)
      .frame(width: 340, height: 50)
      .background(Color(.systemBlue))
      .foregroundColor(.white)
      .clipShape(Capsule())
      .padding()
}
// 相关的属性可以参考 official doc
// https://developer.apple.com/documentation/SwiftUI/Text
```

```swift

// Image
// 显示图像的视图
// 设置相关的css样式(类似jq的链式调用)
Image(systemName: "plus.circle")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
// 具体的样式可以参考文档
// https://developer.apple.com/documentation/SwiftUI/Image

// 1: 如果下想加载本地图片
//    把 需要的图片放在Asset下(新建Image Set,添加不同分辨率下的图片)
Image("LocalImage")
            .resizable()
            .frame(width: 100, height: 100)

// 2: 还可以显示 SF Symbols的相关字体图标
//    注意，既然是字体的图片，和H5一样 具备和text一样的样式
Image(systemName: "plus.circle")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
// 3: 显示网络图片(URL)
//    目前在这个项目中使用第三方的依赖显示网络图片

KFImage(URL(string: "https://xxxx"))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)

// 4:  关于使用swfitUI Image本身实现 远程图片的加载。需要之后研究下

// 5: 图片文字叠加使用 (overlay)
Image("LocalImage")
            .resizable()
            .frame(width: 100, height: 100)
            .overlay(
                   Image(systemName: "heart")
                   .font(.system(size: 50))
                   .foregroundColor(.black)
                   .opacity(0.5)
            )

Image("test")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300)
            .overlay(
                 Color.black.opacity(0.4)
                    .overlay(
                         Text("我是文字")
                             .font(.title)
                             .fontWeight(.bold)
                             .foregroundColor(.white)
                             .frame(width: 300, height: 100, alignment:.center)
	            )
```

```swift
// TextField
// 可编辑的文本
// https://developer.apple.com/documentation/SwiftUI/TextField
// 官网的解释非常的好，不赘述了
```

```swift
// button
// 使用也是非常简单 不在赘述
// https://developer.apple.com/documentation/SwiftUI/Button
// 主要是一些属性,需要时常看下文档
```

```swift
// Tabview
@State private var selectedeIndex = 0
FeedView()
       .onTapGesture {
                self.selectedeIndex = 0
            }
            .tabItem {
                Image(systemName: "house")
            }.tag(0)
        
        ExploreView()
            .onTapGesture {
                self.selectedeIndex = 1
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
            }.tag(1)
        
        NotificationsView()
            .onTapGesture {
                self.selectedeIndex = 2
            }
            .tabItem {
                Image(systemName: "bell")
            }.tag(2)
        
        
        MessageView()
            .onTapGesture {
                self.selectedeIndex = 3
            }
            .tabItem {
                Image(systemName: "envelope")
            }.tag(3)

// 这个也没什么多说的
// 不过自定义tabview需要研究下(根据看到的一些app的实际效果)
```

```swift
// 在swiftUi 中使用十六hex的颜色

extension Color {
    convenience init(hex: String) {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 1.0
        var hex: String = hex

        if hex.hasPrefix("#") {
            let index = hex.index(hex.startIndex, offsetBy: 1)
            hex = String(hex[index...])
        }

        let scanner = Scanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        if scanner.scanHexInt64(&hexValue) {
            switch hex.count {
            case 3:
                red = CGFloat((hexValue & 0xF00) >> 8) / 15.0
                green = CGFloat((hexValue & 0x0F0) >> 4) / 15.0
                blue = CGFloat(hexValue & 0x00F) / 15.0
            case 4:
                red = CGFloat((hexValue & 0xF000) >> 12) / 15.0
                green = CGFloat((hexValue & 0x0F00) >> 8) / 15.0
                blue = CGFloat((hexValue & 0x00F0) >> 4) / 15.0
                alpha = CGFloat(hexValue & 0x000F) / 15.0
            case 6:
                red = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8) / 255.0
                blue = CGFloat(hexValue & 0x0000FF) / 255.0
            case 8:
                red = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                blue = CGFloat((hexValue & 0x0000FF00) >> 8) / 255.0
                alpha = CGFloat(hexValue & 0x000000FF) / 255.0
            default:
                print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
            }
        } else {
            print("Scan hex error")
        }
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
```

```swift
// 从相册上传图片
// https://github.com/Until-You-Possible/Twitter/blob/master/coding/TwitterSwift/TwitterSwift/Utils/ImagePicker.swift

// 具体代码的实现 还是需要研究下
// 应该是还有好多方法属性或者说定制化操作需要研究的
// 根据看到的格式个样的上传操作
```

```swift
// 列表和滚动视图
// ForEach() {}
// 需要展示的view放进去就ok
// scrollView {}
```

```swift
// Spacer 和 Divider
// 其包含 Stack 布局的主轴扩展，如果不包含在 Stack 中，则在两个轴上扩展。占位用(至少现在我这样用)
// divider分割线
// 分割线也有不少可以调用的方法 用的时候在查询就行
```

```swift
// 组件之间的通信(重点)
// 具体可以参考代码
// https://github.com/Until-You-Possible/Twitter
```

```swift
// 数据的绑定
```

```swift
// 第三方模块的使用
```

```swift
// UI 相关文档参考
// https://developer.apple.com/cn/documentation/widgetkit/swiftui-views/
```

# 2: 需要继续掌握或者加强

```swift
1: 整体来说，虽然对于前端来说UI不是什么问题，但是对于swiftUI还是要多写多总结。细节其实蛮多的
2: 对swift也是需要系统的整理一遍 对比js java学习效果会更加好
3: 既然这个项目用了firebase，最后也整理下firebase的一些内容

```

```swift
// 结合前端的一些经验和自己看到的一些app的效果，以及一些想法
// 在结合这个项目整理出一些需要开始研究的具体的问题
1: swiftUI image如何实现远程图片的加载？
2: 上传图片的定制化样式，多选等一些列问题？
3: tabView的个性化定制
4: 如何调用系统的一些api(震动之类的)
5: 对app的整个执行周期还是有些模糊，需要研究
6: 如何制作app启动的动画
7: app开始的那个广告制作的实现
8: 对NavigationLink/View需要进一步研究下，导航。已经来回的参数传递
9: 需要了解ios的一些基本设计规范，用法
10: 对UIkit也需要做一些前期的了解
11: request的相关问题，请求，参数，返回等
12: 如何使用第三方的icon和字体库
```
