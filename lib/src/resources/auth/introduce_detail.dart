import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

var logoImg = AssetImage('assets/graphics/logo.png');
var backgound = AssetImage('assets/graphics/backgound-introduce.png');
var image = Image(
  image: logoImg,
);

class IntroduceDetailPage extends StatefulWidget {
  final Map<String, Object> data;
  final int page;

  IntroduceDetailPage({Key key, this.data, this.page, BuildContext context})
      : super(key: key);
  @override
  _IntroducdDetailPage createState() => _IntroducdDetailPage();
}

class _IntroducdDetailPage extends State<IntroduceDetailPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.data[0]);
    return Scaffold(
        body: widget.page == 0
            ? _IntroduceFirst(context: context, data: widget.data)
            : _IntroduceNext(context: context, data: widget.data));
  }
}

Widget _IntroduceFirst(
    {@required BuildContext context, Map<String, Object> data}) {
  var heightOfScreen = MediaQuery.of(context).size.height;

  Color gradientStart = Colors.transparent;
  Color gradientEnd = Colors.black;

  return Material(
      child: Stack(children: <Widget>[
    ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [gradientStart, gradientEnd],
        ).createShader(Rect.fromLTRB(0, -140, rect.width, rect.height - 20));
      },
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: data['backgound'] as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
    Column(
      children: [
        SizedBox(height: heightOfScreen / 2),
        _IntroduceText(data: data),
      ],
    )
  ]));
}

Widget _IntroduceNext(
    {@required BuildContext context, Map<String, Object> data}) {
  var heightOfScreen = MediaQuery.of(context).size.height;
  return Container(
    color: Colors.black,
    child: Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: heightOfScreen / 2,
            child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: data['pic'] as ImageProvider,
                        fit: BoxFit.contain))),
          ),
          _IntroduceText(data: data),
        ],
      ),
    ),
  );
}

Widget _IntroduceText({@required Map<String, Object> data}) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          data['title1'],
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          data['title2'],
          style: TextStyle(
              color: Colors.white,
              fontSize: data['title2'] != '' ? 30 : 0,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Center(
          child: Text(
            data['detail'],
            style: TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
