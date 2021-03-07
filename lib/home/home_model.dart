import 'package:flutter_proxy_pattern_demo/home/home_bean.dart';
import 'package:flutter_proxy_pattern_demo/home/i_home_model.dart';

class HomeModel implements IHomeModel {
  @override
  HomeBean getHomeBean(int id) {
    HomeBean bean = HomeBean();
    bean.id = id.toString();
    return bean;
  }
}
