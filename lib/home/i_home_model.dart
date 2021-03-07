import 'package:flutter_proxy_pattern_demo/home/home_bean.dart';

abstract class IHomeModel {
  HomeBean getHomeBean(int id);
}
