import 'package:flutter/material.dart';

class ToolBar extends StatelessWidget {
  final child;
  const ToolBar({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            width: double.infinity,
            child: Material(
              elevation: 5,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Color(0xFF6B9949),
                          ),
                          SizedBox(width: 3),
                          Text(
                            'MoocKaa',
                            style: TextStyle(
                                color: Color(0xFF6B9949),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 7),
                    Text(
                      '07:30',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF6B9949),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          '12:30',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '02:00',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '04:40',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '08:30',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Icon(
                      Icons.notifications,
                      color: Color(0xFF6B9949),
                    ),
                  ]),
            ),
          ),
          child != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Container(
                      height: 50,
                      child:
                          Center(child: Material(elevation: 5, child: child))),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
