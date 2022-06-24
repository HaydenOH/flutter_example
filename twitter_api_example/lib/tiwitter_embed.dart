import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class TwitterEmbed extends StatefulWidget {
  final String tweetId;
  TwitterEmbed({Key? key, required this.tweetId}) : super(key: key);

  @override
  State<TwitterEmbed> createState() => _TwitterEmbedState();
}

class _TwitterEmbedState extends State<TwitterEmbed> {
  late bool isLoaded;
  @override
  void initState() {
    super.initState();
    isLoaded = false;
  }
  //response

  final url = Uri.parse(
      "https://api.twitter.com/2/tweets/search/recent?query=from:TwitterDev&tweet.fields=created_at&expansions=author_id&user.fields=created_at");

  @override
  Widget build(BuildContext context) {
    late WebViewController _controll;
    Future<bool> _goBack(BuildContext context) async {
      if (_controll == null) {
        return true;
      }
      if (await _controll!.canGoBack()) {
        _controll!.goBack();
        return Future.value(false);
      } else {
        return Future.value(true);
      }
    }

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
            leading: new IconButton(
              icon: new Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text("WebBrowser")),
        body: WebView(
          onWebViewCreated: (webViewController) {
            _controll = webViewController;
          },
          initialUrl: Uri.dataFromString(
            getHtmlString(widget.tweetId),
            mimeType: 'text/html',
            encoding: Encoding.getByName('utf-8'),
          ).toString(),
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: <JavascriptChannel>{}..add(JavascriptChannel(
              name: "Twitter",
              onMessageReceived: (JavascriptMessage massege) {
                setState(() {
                  isLoaded = true;
                });
              })),
        ),
      ),
      onWillPop: () => _goBack(context),
    );
    // Stack(alignment: AlignmentDirectional.topCenter, children: [
    //   TextButton(
    //       onPressed: () async {
    //         final response = await http.get(url);
    //         print('Response status: ${response.statusCode}');
    //         print('Response body: ${response.body}');
    //       },
    //       child: Text("api 요청")),

    //   Container(
    //     child: AnimatedSwitcher(
    //       duration: const Duration(
    //         milliseconds: 3000,
    //       ),
    //       child:
    //           isLoaded ? const SizedBox.shrink() : CircularProgressIndicator(),
    //       transitionBuilder: (child, animation) {
    //         return FadeTransition(
    //           opacity: animation,
    //           child: child,
    //         );
    //       },
    //     ),
    //   ),
    // ]);
  }
}

//
// <script id="twitter-wjs" type="text/javascript" async defer src="https://platform.twitter.com/widgets.js" onload="createMyTweet()"></script>
// <a class="twitter-timeline" href="https://twitter.com/ninokuni_global?ref_src=twsrc%5Etfw">Tweets by ninokuni_global</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
// <a class="twitter-timeline" data-theme="dark" href="https://twitter.com/official_a3_gb?ref_src=twsrc%5Etfw">Tweets by official_a3_gb</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
String getHtmlString(String tweetId) {
  return """
        <html>
        <head>
          <meta name="viewport" content="width=device-width, initial-scale=1">
        </head>
        <body>
            <div id="container"></div>
        </body>
        <script id="twitter-wjs" type="text/javascript" async defer src="https://platform.twitter.com/widgets.js" onload="createMyTweet()"></script>
        <script>
          function  createMyTweet() {  
            var twtter = window.twttr;
            twttr.widgets.createTweet(
              '$tweetId',
              document.getElementById('container'),
              {theme: "dark"}
              ).then( function( el ) {      
                Twitter.postMessage("Tweet Loaded");
                });
          }
        </script>
      </html>
    """;
}
