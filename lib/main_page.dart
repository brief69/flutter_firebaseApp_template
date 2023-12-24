
// main_page.dart
import 'package:flutter/material.dart';

// ボトムナビゲーションバーを定義します
var bottomNavigationBar = BottomNavigationBar(
  // ボトムナビゲーションバーアイテムのリストを定義します
  items: const <BottomNavigationBarItem>[
    // ホームアイテムを定義します
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    // 追加アイテムを定義します
    BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: 'Add',
    ),
    // ウォレットアイテムを定義します
    BottomNavigationBarItem(
      icon: Icon(Icons.wallet_travel),
      label: 'Wallet',
    ),
  ],
);