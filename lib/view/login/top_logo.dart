import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100.0, bottom: 50.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,

        // title display by image (using AssetImage in this case)
        children: <Widget>[Image(image: AssetImage('assets/AppName.png'))],
      ),
    );
  }
}
