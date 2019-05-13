//
//  GlyphGenerationViewController.m
//  NSLayoutManager
//
//  Created by pantosoft on 2019/5/13.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "GlyphGenerationViewController.h"
#import "CustomTextView.h"
#import "LayoutManagerOne.h"
#import "UIViewController+addTextView.h"
@interface GlyphGenerationViewController ()
@property (nonatomic, strong) UITextView *textView;
@end

@implementation GlyphGenerationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView = [self addCustomTextView:[LayoutManagerOne new] height:200];
    self.textView.text = @"黄初三年,  余朝京师, 还济洛川. 古人有言, 斯水之神, 名曰宓妃. 感宋玉对楚王神女之事, 遂作斯赋. 其辞曰：余从京域, 言归东藩. 背伊阙, 越轘辕, 经通谷, 陵景山. 日既西倾, 车殆马烦. 尔乃税驾乎蘅皋, 秣驷乎芝田, 容与乎阳林, 流眄乎洛川. 于是精移神骇, 忽焉思散. 俯则未察, 仰以殊观, 睹一丽人, 于岩之畔. 乃援御者而告之曰：“尔有觌于彼者乎？彼何人斯？若此之艳也！”御者对曰：“臣闻河洛之神, 名曰宓妃. 然则君王所见, 无乃是乎？其状若何？臣愿闻之. ”余告之曰：“其形也, 翩若惊鸿, 婉若游龙. 荣曜秋菊, 华茂春松. 髣髴兮若轻云之蔽月, 飘飖兮若流风之回雪. 远而望之, 皎若太阳升朝霞；迫而察之, 灼若芙蕖出渌波. 秾纤得衷, 修短合度. 肩若削成, 腰如约素. 延颈秀项, 皓质呈露. 芳泽无加, 铅华弗御. 云髻峨峨, 修眉联娟. 丹唇外朗, 皓齿内鲜, 明眸善睐, 靥辅承权. 瑰姿艳逸, 仪静体闲. 柔情绰态, 媚于语言. 奇服旷世, 骨像应图. 披罗衣之璀粲兮, 珥瑶碧之华琚. 戴金翠之首饰, 缀明珠以耀躯. 践远游之文履, 曳雾绡之轻裾. 微幽兰之芳蔼兮, 步踟蹰于山隅. 于是忽焉纵体, 以遨以嬉. 左倚采旄, 右荫桂旗. 壤皓腕于神浒兮, 采湍濑之玄芝. 余情悦其淑美兮, 心振荡而不怡. 无良媒以接欢兮, 托微波而通辞. 愿诚素之先达兮, 解玉佩以要之. 嗟佳人之信修, 羌习礼而明诗. 抗琼珶以和予兮, 指潜渊而为期. 执眷眷之款实兮, 惧斯灵之我欺. 感交甫之弃言兮, 怅犹豫而狐疑. 收和颜而静志兮, 申礼防以自持. 于是洛灵感焉, 徙倚彷徨, 神光离合, 乍阴乍阳. 竦轻躯以鹤立, 若将飞而未翔. 践椒涂之郁烈, 步蘅薄而流芳. 超长吟以永慕兮, 声哀厉而弥长. 尔乃众灵杂沓, 命俦啸侣, 或戏清流, 或翔神渚, 或采明珠, 或拾翠羽. 从南湘之二妃, 携汉滨之游女. 叹匏瓜之无匹兮, 咏牵牛之独处. 扬轻袿之猗靡兮, 翳修袖以延伫. 体迅飞凫, 飘忽若神, 凌波微步, 罗袜生尘. 动无常则, 若危若安. 进止难期, 若往若还. 转眄流精, 光润玉颜. 含辞未吐, 气若幽兰. 华容婀娜, 令我忘餐. 于是屏翳收风, 川后静波. 冯夷鸣鼓, 女娲清歌. 腾文鱼以警乘, 鸣玉鸾以偕逝. 六龙俨其齐首, 载云车之容裔, 鲸鲵踊而夹毂, 水禽翔而为卫. 于是越北沚. 过南冈, 纡素领, 回清阳, 动朱唇以徐言, 陈交接之大纲. 恨人神之道殊兮, 怨盛年之莫当. 抗罗袂以掩涕兮, 泪流襟之浪浪. 悼良会之永绝兮, 哀一逝而异乡. 无微情以效爱兮, 献江南之明珰. 虽潜处于太阴, 长寄心于君王. 忽不悟其所舍, 怅神宵而蔽光. 于是背下陵高, 足往神留, 遗情想像, 顾望怀愁. 冀灵体之复形, 御轻舟而上溯. 浮长川而忘返, 思绵绵而增慕. 夜耿耿而不寐, 沾繁霜而至曙. 命仆夫而就驾, 吾将归乎东路. 揽騑辔以抗策, 怅盘桓而不能去.";
}

- (IBAction)generateGlyph:(id)sender {
//    NSLayoutManager *layoutManager = self.textView.layoutManager;
//    NSInteger length = self.textView.text.length;
//    NSRange range = NSMakeRange(length - 100, 100);
//    [layoutManager ensureGlyphsForCharacterRange:range];
//    [layoutManager ensureLayoutForGlyphRange:range];
//    [layoutManager ensureLayoutForBoundingRect:CGRectMake(20, 20, 100, 100) inTextContainer:self.textView.textContainer];
//    [layoutManager ensureLayoutForTextContainer:self.textView.textContainer];
}

@end
