import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  // このクラスは状態の設定です。
  // これは提供された値を保持します（この場合は何もありません）
  // 親によって提供され、Stateのbuildメソッドで使用されます。
  // Widgetサブクラスのフィールドは常に「final」でマークされます。

  const Counter ({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      // このsetStateの呼び出しは、Flutterフレームワークに、このStateで何かが変更されたことを伝えます。
      // これにより、下記のbuildメソッドが再実行され、表示が更新された値を反映できるようになります。
      // setState()を呼び出さずに_counterを変更すると、buildメソッドは再度呼び出されません。
      // そのため、何も起こらないように見えます。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // このメソッドは、上記の_incrementメソッドのように呼び出されるたびに再実行されます。
    // Flutterフレームワークは、buildメソッドを高速に再実行するように最適化されています。
    // つまり、更新が必要なものだけを再構築できるため、ウィジェットのインスタンスを個別に変更する必要はありません。
    return Row(
      children: <Widget>[
        ElevatedButton(
          onPressed: _increment,
          child: const Text('Increment'),
        ),
        const SizedBox(width: 16),
        Text('Count: $_counter'),
      ],
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Counter(),
        )
      )
    )
  );
}