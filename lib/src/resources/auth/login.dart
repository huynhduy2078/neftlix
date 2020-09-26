import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

bool isShowPassword = false;

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF111111),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        actions: <Widget>[
          InkWell(
            onTap: () => print("go to help"),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text("Trợ giúp",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          )
        ],
      ),
      body: Container(
          color: Color(0xFF111111),
          padding: EdgeInsets.only(bottom: 15),
          child: Scrollbar(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      TextFormField(
                          validator: (value) {
                            validateField(value: value, flied: 'email');
                          },
                          decoration: InputDecoration(
                              filled: true,
                              hintText: 'Email hoặc số điện thoại',
                              labelText: 'Email hoặc số điện thoại',
                              labelStyle: TextStyle(color: Color(0xFFEDEDED)),
                              fillColor: Color(0xFF323332)),
                          onChanged: (value) {},
                          style: TextStyle(
                              color: Color(0xFFEDEDED),
                              backgroundColor: Color(0xFF323332))),
                      SizedBox(height: 20),
                      TextFormField(
                          validator: (value) {
                            validateField(value: value, flied: 'password');
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              filled: true,
                              hintText: 'Mật khẩu',
                              labelText: 'Mật khẩu',
                              labelStyle: TextStyle(color: Color(0xFFEDEDED)),
                              fillColor: Color(0xFF323332),
                              suffixText: 'HIỂN THỊ',
                              suffixStyle: TextStyle(
                                  color: Color(0xFFEDEDED), fontSize: 15)),
                          onChanged: (value) {},
                          style: TextStyle(
                              color: Color(0xFFEDEDED),
                              backgroundColor: Color(0xFF323332))),
                      SizedBox(height: 20),
                      ButtonTheme(
                        minWidth: 1000,
                        height: 50,
                        child: RaisedButton(
                          onPressed: () => {},
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10)),
                          color: Color(0xFFE50F1D),
                          child: Text("Đăng Nhập",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                          onTap: () => print('Khôi phục mat khau'),
                          child: Text('Khôi phục mật khẩu',
                              style: TextStyle(
                                  color: Color(0xFFAEAEAE),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(height: 25),
                      Text(
                        'Quá trình đăng nhập được Google reCAPCHA bảo vệ để đảm bảo bạn không phải robot.',
                        style:
                            TextStyle(color: Color(0xFFAEAEAE), fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text:
                                  'Thông tin do Google reCAPCHA thu thập sẽ tuân theo ',
                              style: TextStyle(
                                  color: Color(0xFFAEAEAE), fontSize: 15)),
                          TextSpan(
                              text: 'Chính sách quyền riêng tư',
                              style: TextStyle(
                                  color: Color(0xFF2161A5), fontSize: 15),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () => print("tap chính sách")),
                          TextSpan(
                              text: ' và ',
                              style: TextStyle(
                                  color: Color(0xFFAEAEAE), fontSize: 15)),
                          TextSpan(
                              text: 'Điều khoản dịch vụ',
                              style: TextStyle(
                                  color: Color(0xFF2161A5), fontSize: 15),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () => print("tap điều khoản")),
                          TextSpan(
                              text:
                                  ' của google, và được dùng để cung cấp, duy trì và cải thiện dịch vụ reCAPTCHA cũng như các mục đích bảo mật nói chung (Thông tin này không được dùng để cá nhân hóa quảng cáo của Google)',
                              style: TextStyle(
                                  color: Color(0xFFAEAEAE), fontSize: 15)),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

String validateField({@required value, flied}) {
  //   if(value.isEmpty) {

  //   }
  //   if (value == 'admin') {
  //     return null;
  //   }
  //   return ""
  // }
}
