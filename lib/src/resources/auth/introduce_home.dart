import 'package:flutter/material.dart';
import 'package:test1/src/resources/auth/login.dart';
import 'introduce_detail.dart';

var logoImg = AssetImage('assets/graphics/logo.png');
var backgound = AssetImage('assets/graphics/background_introduce.png');
var image = Image(
  image: logoImg,
);
var pic1 = AssetImage('assets/graphics/logo_introduce_1.png');
var pic2 = AssetImage('assets/graphics/logo_introduce_2.png');
var pic3 = AssetImage('assets/graphics/logo_introduce_3.png');

var data = [
  {
    "title1": "Bạn muốn",
    "title2": "Tham gia Netflix?",
    "detail":
        "Bạn không thể đăng kí tài khoản Netflix trong ứng dụng. Chúng tôi biết điều này hoiư phiền phức. Sau khi trờ thành thành viên, bạn có thể bắt đầu xem trong ứng dụng.",
    "backgound": backgound,
  },
  {
    "title1": "Xem trên bất kỳ",
    "title2": "Thiết bị nào",
    "detail":
        "Phát trực tiếp trên điện thoại, máy tính bảng, laptop va TV của bạn mà không cần trả thêm phí.",
    "pic": pic1,
  },
  {
    "title1": "3,2,1...Tải xuống!",
    "title2": "",
    "detail": "Luôn có nội dung để xem ngoại tuyến",
    "pic": pic2,
  },
  {
    "title1": "Không có hợp đồng",
    "title2": "phiền toái",
    "detail": "Hủy bất kỳ lúc nào.",
    "pic": pic3,
  },
];

final int _numPages = data.length;
final PageController _pageController = PageController(initialPage: 0);
int _currentPage = 0;

class IntroduceHomePage extends StatefulWidget {
  @override
  _IntroduceHomePage createState() => _IntroduceHomePage();
}

List<Widget> _buildPageIndicator() {
  List<Widget> list = [];
  for (int i = 0; i < _numPages; i++) {
    list.add(i == _currentPage ? _indicator(true) : _indicator(false));
  }
  return list;
}

Widget _indicator(bool isActive) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 150),
    margin: EdgeInsets.all(3),
    height: 8.0,
    width: 13,
    decoration: BoxDecoration(
      color: isActive ? Colors.red : Colors.white,
      shape: BoxShape.circle,
    ),
  );
}

class _IntroduceHomePage extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: PageView(
                physics: ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: <Widget>[
                  for (var i in data)
                    IntroduceDetailPage(
                        context: context, data: i, page: _currentPage),
                ]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 100, height: 70, child: image),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () => print("help"),
                            child: Text("Trợ Giúp",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () => print("quyền riêng tư"),
                            child: Text("Quyền riêng tư",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // IntroducePage(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                    child: ButtonTheme(
                      minWidth: 1000,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()))
                        },
                        color: Colors.red,
                        child: Text("Đăng Nhập",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
