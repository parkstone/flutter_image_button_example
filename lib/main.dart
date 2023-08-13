import 'package:flutter/material.dart';
import 'package:flutter_image_button/simple_image_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("alert"),
          content: const Text('image button click'),
          actions: <Widget>[
            OutlinedButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Image Button'),
      ),
      body: Center(
          child: SizedBox(
            width: 200,
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: SimpleImageButton(
                      upImage: Image.asset('assets/image/btn_black_empty_up.png', fit: BoxFit.fill),
                      downImage: Image.asset('assets/image/btn_black_empty_down.png', fit: BoxFit.fill),
                      buttonText: 'click',
                      buttonTextColor: Colors.white,
                      onPressed: () => _showAlert()
                  ),
                ),
                Flexible(
                  child: SimpleImageButton(
                    upImage: Image.asset('assets/image/btn_black_empty_up.png', fit: BoxFit.fill),
                    downImage: Image.asset('assets/image/btn_black_empty_down.png', fit: BoxFit.fill),
                    buttonText: 'click',
                    buttonTextColor: Colors.white,
                    imageButtonFlex: ImageButtonFlex(3,6,4),
                    onPressed: () {},
                  ),
                ),
                Flexible(
                  child: SimpleImageButton(
                    upImage: Image.asset('assets/image/btn_confirm_up.png', fit: BoxFit.fill),
                    downImage: Image.asset('assets/image/btn_confirm_down.png', fit: BoxFit.fill),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
