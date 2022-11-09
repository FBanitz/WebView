import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'WebView Demo',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();

    String? url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[900],
        child: SafeArea(
          child: Center(
            child: url == null ? 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: controller,
                      decoration: const InputDecoration(
                        labelText: 'Enter URL',
                        labelStyle: TextStyle(color: Colors.white),
                        
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (controller.text.startsWith( 'https://')) {
                          url = controller.text;
                        } else {
                          url = 'https://${controller.text}';
                        }
                      });
                    },
                    child: const Text('Go !'),
                  ),
                ],
              )
              : WebViewX(
                height: double.infinity,
                width: double.infinity,
                initialContent: url!,
                initialSourceType: SourceType.url,
              )
          ),
        ),
      ),
    );
  }
}
