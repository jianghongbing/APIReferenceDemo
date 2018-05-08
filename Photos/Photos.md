### Photos: 照片库,提供app访问照片,本地和iCloud中的都可以提供访问
#### 常用到的类
1. PHPhotoLibrary: 相当于图片库的管理者,其功能如下
* 请求访问PhotoLibrary的访问权限,使用Photos中的类之前,一般都需要用户授权访问图库
* 执行某些操作,以及操作完后的回调
* 为某些对象,添加对图库的改变的监听
2. PHAsset:代表一张图片,一段视频,Photos里面最小的单元
3. PHCollection:抽象类,具体子类如下
* PHAssetCollection:PHAsset的集合
* PHCollectionList: PHCollection的集合


