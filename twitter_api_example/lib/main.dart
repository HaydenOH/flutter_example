import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:twitter_api_example/tiwitter_embed.dart';
import "package:twitter_api_v2/twitter_api_v2.dart" as v2;

// API KEY
// IW1h6Fi3NwRUqseIr6PGQPpF4

// API Key Secret
// Bhp2Dpn1KxuktfOkwMYmD4ragKnUlWDH85Enc99u84mFM1b15i

// Bearer Token
// AAAAAAAAAAAAAAAAAAAAAAzWdwEAAAAAE%2FFf4V6cPoIqoYaFi2JQz87cSJs%3DnRSM5fE3ARWQ15Q8gJFeHDi4z7EMpm7laFTWjIekmBr2c1T7ae

void main() async {
  await dotenv.load(fileName: 'assets/config/.env');

  runApp(const MyApp());
  //! You need to get keys and tokens at https://developer.twitter.com
  final twitter = v2.TwitterApi(
    //! Authentication with OAuth2.0 is the default.
    //!
    //! Note that to use endpoints that require certain user permissions,
    //! such as Tweets and Likes, you need a token issued by OAuth2.0 PKCE.
    bearerToken: dotenv.get('TWITTER_BEARER_TOKEN'),

    //! Or perhaps you would prefer to use the good old OAuth1.0a method
    //! over the OAuth2.0 PKCE method. Then you can use the following code
    //! to set the OAuth1.0a tokens.
    //!
    //! However, note that some endpoints cannot be used for OAuth 1.0a method
    //! authentication.
    oauthTokens: v2.OAuthTokens(
      consumerKey: dotenv.get('TWITTER_CONSUMER_KEY'),
      consumerSecret: dotenv.get('TWITTER_CONSUMER_SECRET_KEY'),
      accessToken: dotenv.get('TWITTER_ACCESS_TOKEN'),
      accessTokenSecret: dotenv.get('TWITTER_ACCESS_SECRET_TOKEN'),
    ),
  );

  try {
    // Get the authenticated user's profile.
    final me = await twitter.usersService.lookupMe();
    print("me$me");
    // final userId =
    //     await twitter.usersService.lookupByName(username: "ninokuni");
    // print(userId.data.id);
    // final id = userId.data.id;
    // final list = await twitter.tweetsService.searchRecent(query: id);

    // print(list);

    // Get the tweets associated with the search query.
    final tweets = await twitter.tweetsService.searchRecent(
      query: 'from:official_a3_gb',
      // You can expand the search result.
      tweetFields: [v2.TweetField.createdAt],

      expansions: [
        v2.TweetExpansion.authorId,
        // v2.TweetExpansion.inReplyToUserId,
      ],
      userFields: [
        v2.UserField.createdAt
        // v2.UserField.location,
        // v2.UserField.verified,
        // v2.UserField.entities,
        // v2.UserField.publicMetrics,
      ],
    );

    print(tweets.data);

    // await twitter.tweetsService.createLike(
    //   userId: me.data.id,
    //   tweetId: tweets.data.first.id,
    // );

    // High-performance Volume Stream endpoint is available.
    // final volumeStream = await twitter.tweetsService.connectVolumeStream();
    // await for (final response in volumeStream.handleError(print)) {
    //   print(response);
    // }

    // Also high-performance Filtered Stream endpoint is available.
    // await twitter.tweetsService.createFilteringRules(
    //   rules: [
    //     v2.FilteringRuleData(value: '#ElonMusk'),
    //     v2.FilteringRuleData(value: '#Tesla'),
    //     v2.FilteringRuleData(value: '#SpaceX'),
    //   ],
    // );

    final filteredStream = await twitter.tweetsService.connectFilteredStream();
    await for (final response in filteredStream.handleError(print)) {
      // print("response.data::::$response.data");
      // print("response.matchingRules::::::$response.matchingRules");
    }
  } on v2.TwitterException catch (e) {
    // print(e.response.headers);
    // print(e.body);
    // print(e);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<String> tweetIdList = [
    "1538786227343699969",
    "1538522035411771393",
    "1538816836359229440",
    "1538522035411771393"
  ];
  //1538522035411771393

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: TwitterEmbed(
          tweetId: tweetIdList[0],
        ));
  }
}
