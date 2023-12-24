
// main.dart
import 'package:flutter/material.dart';

// アプリケーションを起動する
void main() {
  runApp(const MyApp());
}

// MyAppクラスはアプリケーションのルートウィジェットを定義します
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // MaterialAppウィジェットはマテリアルデザインアプリを作成します
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        hintColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      // MyHomePageはアプリケーションのホームページを定義します
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// MyHomePageクラスはアプリケーションのホームページを定義します
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  // _MyHomePageStateはMyHomePageの状態を管理します
  State<MyHomePage> createState() => _MyHomePageState();
}

// _MyHomePageStateクラスはMyHomePageの状態を管理します
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // _incrementCounterメソッドはカウンターを増やします
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffoldウィジェットは基本的なマテリアルデザインのビジュアルレイアウト構造を提供します
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.title, style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(color: Colors.white),
            ),
            // カウンターの現在の値を表示します
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
      // FloatingActionButtonは浮動アクションボタンを表示します
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // この末尾のコンマは、ビルドメソッドの自動フォーマットをより良くします。
    );
  }
}
