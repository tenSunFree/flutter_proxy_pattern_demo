import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_proxy_pattern_demo/home/home_bean.dart';
import 'package:flutter_proxy_pattern_demo/home/home_model.dart';
import 'package:flutter_proxy_pattern_demo/home/home_model_proxy.dart';
import 'package:flutter_proxy_pattern_demo/home/i_home_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IHomeModel _proxy;
  List<HomeBean> _list;

  @override
  void initState() {
    super.initState();
    _proxy = HomeModelProxy(HomeModel());
    _list = List.generate(10, (count) => _proxy.getHomeBean(count));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset("assets/icon_background.png"),
      Column(children: <Widget>[
        Expanded(child: SizedBox(), flex: 36),
        Expanded(
            child: ScrollConfiguration(
                behavior: const ScrollBehavior(),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding:
                        const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                    child: Row(children: <Widget>[
                      for (var bean in _list) buildCard(bean)
                    ]))),
            flex: 59),
        Expanded(child: SizedBox(), flex: 25)
      ])
    ]);
  }

  Card buildCard(HomeBean bean) {
    return Card(
        margin: const EdgeInsets.only(right: 16),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(20)),
        clipBehavior: Clip.antiAlias,
        child: Container(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          Expanded(
              child: GestureDetector(
                  child:
                      Image.asset(bean.list[0], fit: BoxFit.cover, width: 250),
                  onTap: () {
                    print(bean.id);
                  }),
              flex: 25),
          Expanded(child: Center(child: Text(bean.list[1])), flex: 10)
        ])));
  }
}
