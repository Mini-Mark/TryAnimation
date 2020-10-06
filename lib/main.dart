import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomepageState();
  }
}

class _HomepageState extends State<Homepage> {
  FlareControls _controls = FlareControls();

  var RedBox = SizedBox(
    height: 200,
    width: 200,
    child: Container(
      color: Colors.transparent,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Stack(
            overflow: Overflow.clip,
            alignment: Alignment.center,
            children: [
              RedBox,
              Positioned(
                child: Center(
                  child: GestureDetector(
                    onTap: () => _Click(),
                    child: SizedBox(
                      height: 250,
                      width: 250,
                      child: Container(
                        child: FlareActor(
                          'assets/Plus_Animation_Button.flr',
                          fit: BoxFit.cover,
                          animation: 'Stay',
                          controller: _controls,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  _Click() => _controls.play('Click');
}
