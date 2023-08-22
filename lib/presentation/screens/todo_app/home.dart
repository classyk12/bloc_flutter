import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(5),
              child: Text('Todo' + index.toString()),
            );
          },
          itemCount: 20,
          separatorBuilder: (context, index) =>
              const Padding(padding: EdgeInsets.all(10), child: Divider()),
        ));
  }
}
