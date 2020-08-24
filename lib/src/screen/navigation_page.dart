import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Notifications page'),
        ),
        floatingActionButton: ButtonFloating(),
        bottomNavigationBar: ButtonNavigation(),
      ),
    );
  }
}

class ButtonNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int number = Provider.of<_NotificationModel>(context).getNumber;
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bone), title: Text('Bone')),
        BottomNavigationBarItem(
            icon: Stack(
              children: <Widget>[
                FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  // child: Icon(
                  //   Icons.brightness_1,
                  //   size: 8,
                  //   color: Colors.redAccent,
                  // ),
                  child: BounceInDown(
                    animate: (number > 0) ? true : false,
                    from: 10,
                    child: Bounce(
                      from: 10,
                      controller: (controller) =>
                          Provider.of<_NotificationModel>(context)
                              .bounceController = controller,
                      child: Container(
                        child: Text('$number',
                            style:
                                TextStyle(color: Colors.white, fontSize: 8.0)),
                        alignment: Alignment.center,
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            color: Colors.redAccent, shape: BoxShape.circle),
                      ),
                    ),
                  ),
                )
              ],
            ),
            title: Text('Notifications')),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.dog), title: Text('My dog')),
      ],
    );
  }
}

class ButtonFloating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: FaIcon(FontAwesomeIcons.play),
      onPressed: () {
        final notiMOdel =
            Provider.of<_NotificationModel>(context, listen: false);
        int number = notiMOdel.getNumber;
        number++;
        notiMOdel.setNumber = number;

        if (number >= 2) {
          final controller = notiMOdel.bounceController;
          controller.forward(from: 0.0);
        }
      },
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _number = 0;
  AnimationController _bounceController;
  int get getNumber => this._number;

  set setNumber(int value) {
    this._number = value;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;

  set bounceController(AnimationController controller) {
    this._bounceController = controller;
  }
}
