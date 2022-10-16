import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Stream<int> counterStream() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 2));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
      ),
      body: Center(
        child: StreamBuilder(
            stream: counterStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Loading...');
              }
              return Text('${snapshot.data}');
            }),
      ),
    );
  }
}
