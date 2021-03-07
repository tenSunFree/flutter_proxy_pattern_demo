import 'package:flutter_proxy_pattern_demo/home/home_bean.dart';
import 'package:flutter_proxy_pattern_demo/home/i_home_model.dart';

class HomeModelProxy implements IHomeModel {
  final Map<int, List<String>> detailsMap = {
    0: ["assets/icon_enchanted_river.png", "菲律賓-蘇里高神秘河"],
    1: ["assets/icon_glacier_bay.jpg", "美國-冰川灣國家公園"],
    2: ["assets/icon_iguazu_falls.png", "阿根廷-伊瓜蘇瀑布"],
    3: ["assets/icon_machu_picchu.jpg", "秘魯-馬丘比丘"],
    4: ["assets/icon_namib_desert.jpg", "納米比亞-納米比沙漠"],
    5: ["assets/icon_prague.jpg", "捷克-布拉格"]
  };
  final IHomeModel model;

  HomeModelProxy(this.model);

  @override
  HomeBean getHomeBean(int id) {
    int length = detailsMap.length;
    HomeBean bean = model.getHomeBean(id % length);
    List<String> list = detailsMap[id % length];
    bean.list = list;
    return bean;
  }
}
