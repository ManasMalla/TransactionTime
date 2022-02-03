import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:transaction_time/size_provider.dart';

void main() {
  runApp(const TransactionTime());
}

class TransactionTime extends StatefulWidget {
  const TransactionTime({Key? key}) : super(key: key);

  @override
  _TransactionTimeState createState() => _TransactionTimeState();
}

class _TransactionTimeState extends State<TransactionTime> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      home: const TransactionTimeScaffold(),
    );
  }
}

class TransactionTimeScaffold extends StatefulWidget {
  const TransactionTimeScaffold({Key? key}) : super(key: key);

  @override
  _TransactionTimeScaffoldState createState() =>
      _TransactionTimeScaffoldState();
}

class _TransactionTimeScaffoldState extends State<TransactionTimeScaffold> {
  var purple = Color(0xFF3e4685);
  var paymentFrom = "Andrea";
  var paymentAmount = 30;
  @override
  Widget build(BuildContext context) {
    SizeProvider().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFf3f7ff),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: 28.height,
              bottom: 32.height,
              left: 24.width,
              right: 24.width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      "assets/chevron_left.svg",
                      height: 14.height,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      "assets/search.svg",
                      height: 16.height,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 27.height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Recent Transactions",
                    style: TextStyle(
                        fontSize: 20.height,
                        color: purple,
                        fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "See all",
                      style: TextStyle(
                          fontSize: 14.height,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 27.height,
              ),
              TChipList((state) {}),
              SizedBox(
                height: 27.height,
              ),
              Text(
                "Today",
                style: TextStyle(
                    fontSize: 18.height,
                    color: purple,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 27.height,
              ),
              PaymentCard(
                  name: paymentFrom,
                  price: NumberFormat.simpleCurrency().format(paymentAmount)),
              SizedBox(
                height: 42.height,
              ),
              Container(
                alignment: Alignment.center,
                child: AnimatedAvatarList(
                    mainAvatarPictureUrl:
                        "https://raw.githubusercontent.com/ManasMalla/Dr.-Aarogya-s-Health-Record/master/app/src/main/res/drawable/manas_malla.png",
                    circleAvatarPictureUrlList: [
                      "https://raw.githubusercontent.com/ManasMalla/Dr.-Aarogya-s-Health-Record/master/app/src/main/res/drawable/manas_malla.png",
                      "https://raw.githubusercontent.com/ManasMalla/Dr.-Aarogya-s-Health-Record/master/app/src/main/res/drawable/manas_malla.png",
                      "https://raw.githubusercontent.com/ManasMalla/Dr.-Aarogya-s-Health-Record/master/app/src/main/res/drawable/manas_malla.png",
                      "https://raw.githubusercontent.com/ManasMalla/Dr.-Aarogya-s-Health-Record/master/app/src/main/res/drawable/manas_malla.png",
                      "https://raw.githubusercontent.com/ManasMalla/Dr.-Aarogya-s-Health-Record/master/app/src/main/res/drawable/manas_malla.png"
                    ]),
              ),
              SizedBox(
                height: 30.height,
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "See Details",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.height),
                ),
                height: 52.height,
                minWidth: double.infinity,
                color: purple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.height)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MainAvatar extends StatelessWidget {
  final String url;
  const MainAvatar(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 243.height,
      width: 243.height,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 3.height, color: Color(0xFFEBEFF8)),
        ),
        padding: EdgeInsets.all(30.height),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 14.height,
              color: Color(0xFFd5e7ff),
            ),
          ),
          padding: EdgeInsets.all(16.height),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 4.height, color: Color(0xFF3e4685))),
            child: Padding(
              padding: EdgeInsets.all(6.height),
              child: ClipOval(
                child: Image.network(url),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedAvatarList extends StatefulWidget {
  final String mainAvatarPictureUrl;
  final List<String> circleAvatarPictureUrlList;
  const AnimatedAvatarList(
      {Key? key,
      required this.mainAvatarPictureUrl,
      required this.circleAvatarPictureUrlList})
      : super(key: key);

  @override
  _AnimatedAvatarListState createState() => _AnimatedAvatarListState();
}

class _AnimatedAvatarListState extends State<AnimatedAvatarList>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _scaleController;
  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    );
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    super.initState();
  }

  double getXPosition(double x, double y, int n, int i, double r) {
    var x_new = x + r * cos(i * 2 * pi / (max(2, n - 1)));
    print("X Position: $x_new");
    return x_new;
  }

  double getYPosition(double x, double y, int n, int i, double r) {
    var y_new = y + r * sin(i * 2 * pi / (max(2, n - 1)));
    print("Y Position: $y_new");
    return y_new;
  }

  @override
  Widget build(BuildContext context) {
    print("BoxSize: ${SizeProvider.heightRatio * 751}");
    print("BoxSize: ${273.height}");
    return FutureBuilder(
        future: Future.delayed(Duration(milliseconds: 1), () {
          _controller.repeat();
          _scaleController.repeat();
        }),
        builder: (context, data) {
          var size = 300;
          var radiusSize = 28;
          var avatarSize = 25;
          return SizedBox(
            height: size.height,
            width: size.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ScaleTransition(
                  scale: Tween<double>(begin: 0.0, end: 4)
                      .animate(_scaleController),
                  child: Container(
                    height: 80.height,
                    width: 80.height,
                    decoration: BoxDecoration(
                        gradient: RadialGradient(colors: [
                          Colors.transparent,
                          Color(0xFFd5e7ff).withOpacity(0.2),
                          Colors.transparent
                        ]),
                        shape: BoxShape.circle),
                  ),
                ),
                MainAvatar(widget.mainAvatarPictureUrl),
                RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                  child: Stack(
                    children: [
                      Positioned(
                        left: getXPosition(
                            size.height / 2 - avatarSize.height,
                            size.height / 2 - avatarSize.height,
                            6,
                            0,
                            (size.height / 2 - radiusSize.height)),
                        top: getYPosition(
                          size.height / 2 - avatarSize.height,
                          size.height / 2 - avatarSize.height,
                          6,
                          0,
                          (size.height / 2 - radiusSize.height),
                        ),
                        child: MiniAvatar(avatarSize,
                            widget.circleAvatarPictureUrlList[0], _controller),
                      ),
                      Positioned(
                        left: getXPosition(
                          size.height / 2 - avatarSize.height,
                          size.height / 2 - avatarSize.height,
                          6,
                          1,
                          (size.height / 2 - radiusSize.height),
                        ),
                        top: getYPosition(
                          size.height / 2 - avatarSize.height,
                          size.height / 2 - avatarSize.height,
                          6,
                          1,
                          (size.height / 2 - radiusSize.height),
                        ),
                        child: MiniAvatar(avatarSize,
                            widget.circleAvatarPictureUrlList[1], _controller),
                      ),
                      Positioned(
                        left: getXPosition(
                          size.height / 2 - avatarSize.height,
                          size.height / 2 - avatarSize.height,
                          6,
                          2,
                          (size.height / 2 - radiusSize.height),
                        ),
                        top: getYPosition(
                          size.height / 2 - avatarSize.height,
                          size.height / 2 - avatarSize.height,
                          6,
                          2,
                          (size.height / 2 - radiusSize.height),
                        ),
                        child: MiniAvatar(avatarSize,
                            widget.circleAvatarPictureUrlList[2], _controller),
                      ),
                      Positioned(
                        left: getXPosition(
                          size.height / 2 - avatarSize.height,
                          size.height / 2 - avatarSize.height,
                          6,
                          3,
                          (size.height / 2 - radiusSize.height),
                        ),
                        top: getYPosition(
                          size.height / 2 - avatarSize.height,
                          size.height / 2 - avatarSize.height,
                          6,
                          3,
                          (size.height / 2 - radiusSize.height),
                        ),
                        child: MiniAvatar(avatarSize,
                            widget.circleAvatarPictureUrlList[3], _controller),
                      ),
                      Positioned(
                        left: getXPosition(
                          size.height / 2 - avatarSize.height,
                          size.height / 2 - avatarSize.height,
                          6,
                          4,
                          (size.height / 2 - radiusSize.height),
                        ),
                        top: getYPosition(
                          size.height / 2 - avatarSize.height,
                          size.height / 2 - avatarSize.height,
                          6,
                          4,
                          (size.height / 2 - radiusSize.height),
                        ),
                        child: MiniAvatar(avatarSize,
                            widget.circleAvatarPictureUrlList[4], _controller),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}

class MiniAvatar extends StatelessWidget {
  final int avatarSize;
  final String url;
  final AnimationController controller;
  const MiniAvatar(this.avatarSize, this.url, this.controller, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 1.0, end: 0.0).animate(controller),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 3.height, color: Colors.white),
            shape: BoxShape.circle),
        height: (avatarSize * 2).height,
        width: (avatarSize * 2).height,
        child: ClipOval(
          child: Image.network(url),
        ),
      ),
    );
  }
}

class PaymentCard extends StatefulWidget {
  final String name;
  final String price;
  const PaymentCard({Key? key, required this.name, required this.price})
      : super(key: key);

  @override
  _PaymentCardState createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.height),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.width)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Icon(
                Icons.payments_rounded,
                size: 28.height,
              ),
              SizedBox(
                width: 12.width,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment",
                    style: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 14.height),
                  ),
                  Text(
                    "Payment from ${widget.name}",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Text(
            widget.price,
            style: TextStyle(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class TChipList extends StatefulWidget {
  final Function(int) onChipChanged;

  const TChipList(this.onChipChanged, {Key? key}) : super(key: key);

  @override
  _TChipListState createState() => _TChipListState();
}

class _TChipListState extends State<TChipList> {
  var state = [true, false, false];
  void resetState(int current) {
    setState(() {
      state = [false, false, false];
      state[current] = true;
      widget.onChipChanged(current);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TChip("All", state[0], () {
          resetState(0);
        }),
        SizedBox(width: 12.width),
        TChip("Income", state[1], () {
          resetState(1);
        }),
        SizedBox(width: 12.width),
        TChip("Expenses", state[2], () {
          resetState(2);
        })
      ],
    );
  }
}

class TChip extends StatefulWidget {
  final String text;
  final bool state;
  final Function() onSelected;

  const TChip(this.text, this.state, this.onSelected, {Key? key})
      : super(key: key);

  @override
  _TChipState createState() => _TChipState();
}

class _TChipState extends State<TChip> {
  var color = Colors.white;
  var textColor = Color(0xFF3e4685);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22.height),
      onTap: () {
        widget.onSelected();
      },
      child: Container(
        decoration: BoxDecoration(
            color: widget.state ? textColor : color,
            borderRadius: BorderRadius.circular(22.height)),
        padding: EdgeInsets.symmetric(horizontal: 22.width, vertical: 4.height),
        child: Text(
          widget.text,
          style: TextStyle(
              color: widget.state ? color : textColor,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
