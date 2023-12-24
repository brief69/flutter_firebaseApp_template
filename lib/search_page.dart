
// search_page.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// SearchPageクラスは検索ページのウィジェットを定義します
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  // buildメソッドはウィジェットを構築します
  Widget build(BuildContext context) {
    // Scaffoldウィジェットはマテリアルデザインの基本的なビジュアルレイアウト構造を提供します
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor, // テーマのプライマリカラーを背景色に設定します
      // StreamBuilderウィジェットは非同期操作を元にウィジェットを作成します
      body: StreamBuilder<QuerySnapshot>(
        // Firestoreの'items'コレクションのスナップショットをストリームとして取得します
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        // builderメソッドはコンテキストとスナップショットを元にウィジェットを作成します
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // スナップショットにエラーがある場合、エラーメッセージを表示します
          if (snapshot.hasError) {
            return const Text('エラーが発生しました');
          }

          // スナップショットの接続状態が待機中の場合、ロード中メッセージを表示します
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("ロード中...");
          }

          // GridViewウィジェットはスクロール可能なグリッドリストを提供します
          return GridView.count(
            crossAxisCount: 2, // グリッドの列数を設定します
            // スナップショットのドキュメントを元にリストを作成します
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              // GestureDetectorウィジェットはタップイベントを検出します
              return GestureDetector(
                onTap: () {
                  // タップ時に詳細ページに遷移します
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage(document: document)),
                  );
                },
                child: Center(
                  // ドキュメントの'name'フィールドをテキストとして表示します
                  child: Text(
                    (document.data() as Map<String, dynamic>)['name'],
                    style: Theme.of(context).textTheme.bodyLarge!,
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

// DetailPageクラスは詳細ページのウィジェットを定義します
class DetailPage extends StatelessWidget {
  final DocumentSnapshot document; // ドキュメントスナップショットを保持します

  const DetailPage({super.key, required this.document});

  @override
  // buildメソッドはウィジェットを構築します
  Widget build(BuildContext context) {
    // Scaffoldウィジェットはマテリアルデザインの基本的なビジュアルレイアウト構造を提供します
    return Scaffold(
      // AppBarウィジェットはアプリケーションバーを提供します
      appBar: AppBar(
        // ドキュメントの'name'フィールドをタイトルとして表示します
        title: Text((document.data() as Map<String, dynamic>)['name']),
      ),
      // ListViewウィジェットはスクロール可能なリストを提供します
      body: ListView(
        children: <Widget>[
          // ListTileウィジェットは一行高の固定高ウィジェットを提供します
          ListTile(
            title: const Text('詳細'), // タイトルとして'詳細'を表示します
            // ドキュメントの'description'フィールドをサブタイトルとして表示します
            subtitle: Text((document.data() as Map<String, dynamic>)['description'] as String? ?? ''),
          ),
        ],
      ),
    );
  }
}

