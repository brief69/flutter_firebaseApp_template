
// home_page.dart
import 'package:flutter/material.dart';

// HomePageクラスはホームページのウィジェットを定義します
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // buildメソッドはウィジェットを構築します
  @override
  Widget build(BuildContext context) {
    // Scaffoldウィジェットは基本的なマテリアルデザインのビジュアルレイアウト構造を提供します
    return Scaffold(
      // AppBarウィジェットはアプリケーションバーを提供します
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        // Textウィジェットはテキストを表示します
        title: Text('corp.', style: Theme.of(context).textTheme.bodyLarge),
      ),
      // ListView.builderウィジェットはスクロール可能なリストを提供します
      body: ListView.builder(
        itemCount: 50,
        // itemBuilderメソッドはリストの各アイテムを構築します
        itemBuilder: (context, index) {
          // ListTileウィジェットは一行高の固定高ウィジェットを提供します
          return ListTile(
            // Textウィジェットはテキストを表示します
            title: Text('Item $index', style: Theme.of(context).textTheme.bodyLarge),
          );
        },
      ),
    );
  }
}
