import 'package:flutter/material.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:twitter_login_example/env.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('twitter_login example app'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              SizedBox(height: 24),
              Text(
                'Twitter API v1.1 is not available when creating a new application in twitter developer from November 15, 2021.\n'
                'Check the Twitter Developer to see if it supports v1.1 or v2.',
              ),
              SizedBox(height: 24),
              Image.asset(
                'assets/twitter_dashboard.png',
                width: double.infinity,
              ),
              SizedBox(height: 24),
              Center(
                child: TextButton(
                  child: Text('use Twitter API v1.1'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                    minimumSize: MaterialStateProperty.all<Size>(Size(160, 48)),
                  ),
                  onPressed: () async {
                    await login();
                  },
                ),
              ),
              SizedBox(height: 24),
              Center(
                child: TextButton(
                  child: Text('use Twitter API v2.0'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                    minimumSize: MaterialStateProperty.all<Size>(Size(160, 48)),
                  ),
                  onPressed: () async {
                    await loginV2();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Use Twitter API v1.1
  Future login() async {
    final twitterLogin = TwitterLogin(
      /// Consumer API keys
      apiKey: API_KEY,

      /// Consumer API Secret keys
      apiSecretKey: API_SECRET_KEY,

      /// Registered Callback URLs in TwitterApp
      /// Android is a deeplink
      /// iOS is a URLScheme
      redirectURI: 'example://',
    );

    /// Forces the user to enter their credentials
    /// to ensure the correct users account is authorized.
    /// If you want to implement Twitter account switching, set [force_login] to true
    /// login(forceLogin: true);
    final authResult = await twitterLogin.login();
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        // success
        print('====== Login success ======');
        break;
      case TwitterLoginStatus.cancelledByUser:
        // cancel
        print('====== Login cancel ======');
        break;
      case TwitterLoginStatus.error:
      case null:
        // error
        print('====== Login error ======');
        break;
    }
  }

  /// Use Twitter API v2.
  Future loginV2() async {
    final twitterLogin = TwitterLogin(
      /// Consumer API keys
      apiKey: API_KEY,

      /// Consumer API Secret keys
      apiSecretKey: API_SECRET_KEY,

      /// Registered Callback URLs in TwitterApp
      /// Android is a deeplink
      /// iOS is a URLScheme
      redirectURI: 'example://',
    );

    /// Forces the user to enter their credentials
    /// to ensure the correct users account is authorized.
    /// If you want to implement Twitter account switching, set [force_login] to true
    /// login(forceLogin: true);
    final authResult = await twitterLogin.loginV2();
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        // success
        print('====== Login success ======');
        break;
      case TwitterLoginStatus.cancelledByUser:
        // cancel
        print('====== Login cancel ======');
        break;
      case TwitterLoginStatus.error:
      case null:
        // error
        print('====== Login error ======');
        break;
    }
  }
}
