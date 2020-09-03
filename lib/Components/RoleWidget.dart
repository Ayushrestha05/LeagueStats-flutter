import 'package:flutter/material.dart';

class RoleWidget extends StatefulWidget {
  final wins;
  final loss;
  final String icon;
  RoleWidget({this.wins, this.loss, this.icon});
  @override
  _RoleWidgetState createState() => _RoleWidgetState();
}

class _RoleWidgetState extends State<RoleWidget> with TickerProviderStateMixin {
  AnimationController winController;
  AnimationController lossController;

  @override
  void initState() {
    super.initState();
    if (widget.wins != 0) {
      winController = AnimationController(
          duration: Duration(seconds: 2),
          vsync: this,
          lowerBound: 0,
          upperBound: widget.wins.toDouble());
      winController.forward();
    } else {
      winController = AnimationController(
          duration: Duration(seconds: 2),
          vsync: this,
          lowerBound: 0,
          upperBound: 1);
      winController.reverse();
    }

    if (widget.loss != 0) {
      lossController = AnimationController(
          duration: Duration(seconds: 2),
          vsync: this,
          lowerBound: 0,
          upperBound: widget.loss.toDouble());
      lossController.forward();
    } else {
      lossController = AnimationController(
          duration: Duration(seconds: 2),
          vsync: this,
          lowerBound: 0,
          upperBound: 1);
      lossController.reverse();
    }
    winController.addListener(() {
      setState(() {
        print('Win: ${winController.value}');
      });
    });
    lossController.addListener(() {
      setState(() {
        print("Loss: ${lossController.value}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 15,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: lossController.value.toInt(), //flex value for losses
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE25656),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: winController.value.toInt(), //flex value for wins
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF68D391),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              width: 30,
              child: Image(
                  image:
                      AssetImage('resources/images/Roles/${widget.icon}.jpg')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Text(
                  '${widget.wins}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF68D391)),
                ),
                Text(
                  '-',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${widget.loss}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE25656)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
