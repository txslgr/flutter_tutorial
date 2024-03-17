import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({ required this.title, super.key });

  // ウィジェットのサブクラスのフィールドは常に "final" でマークされています。
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56, // 論理ピクセル
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row は水平方向にウィジェットを並べるためのウィジェットです。
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null にするとボタンが無効になります。
          ),
          // Expanded は利用可能なスペースを埋めるために子ウィジェットを拡張します。
          Expanded(child: title),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ]
      )
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({ super.key });

  @override
  Widget build(BuildContext context) {
    // Material は UI が表示される紙のようなものです。
    return Material(
      // Column は垂直方向にウィジェットを並べるためのウィジェットです。
      child: Column(
        children: [
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.titleLarge,
            )
          ),
          const Expanded(
            child: Center(
              child: Text('Hello, world!'),
            )
          )
        ]
      )
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      title: 'My app', // OS のタスク切り替えに使われます
      home: SafeArea(
        child: MyScaffold(),
      )
    )
  );
}
