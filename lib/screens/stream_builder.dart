import 'dart:isolate';
import 'dart:async';
import 'package:flutter/material.dart';

class Streamer extends StatefulWidget {
  const Streamer({super.key});

  @override
  State<Streamer> createState() => _StreamerState();
}

class _StreamerState extends State<Streamer> {
  Stream<int>? myStream() async* {
    for (var i = 10; i >= 0; i--) {
      yield i;
      await Future.delayed(
        const Duration(seconds: 1),
      );
    }
  }

  static void computeTask(List<dynamic> args) {
    SendPort sendPort = args[0];
    int result = args[1];
    for (int i = 0; i < 1000; i++) {
      result += i;
    }
    sendPort.send(result);
  }

  var res = 0;
  Future<void> showIsolatedResult() async {
    res = 0;
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(computeTask, [receivePort.sendPort, res]);

    final message = await receivePort.first;
    setState(() {
      res = message;
    });

    receivePort.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("data"),
          StreamBuilder<int>(
            stream: myStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return snapshot.data != 0
                    ? Text('Data: ${snapshot.data}')
                    : const Text("Finished");
              }
            },
          ),
          res == 0 ? const Text("res is 0") : Text("$res"),
          ElevatedButton(
              onPressed: showIsolatedResult, child: const Text("data"))
        ],
      ),
    );
  }
}

void main(List<String> args) {
  runApp(const MaterialApp(home: Streamer()));
}
