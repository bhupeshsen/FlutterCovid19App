import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';

class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsPage();
  }
}

class _NewsPage extends State<NewsPage> {
  //
  WebViewController _webViewController;
  // String filePath = 'files/test.html';

  String filePath = 'https://www.bhaskar.com/coronavirus/';
  _showVersionDialog(context) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String title = "New Update Available";
        String message =
            "Please Wait ";
        //  String btnLabel = "Update Now";
        //String btnLabelCancel = "Later";


        return new Center(
          child: CircularProgressIndicator(),

        );



      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NEWS'),

      backgroundColor:  Color(0xFFE8505B),
      ),
      body: ListView(
        children: <Widget>[

          WebView(

        initialUrl: filePath,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
          //_loadHtmlFromAssets();
        },
      ),
        ],
      )


    );
  }

  _loadHtmlFromAssets() async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
