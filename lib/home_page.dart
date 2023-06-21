import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double result = 0;

  @override
  Widget build(BuildContext context) {
    //text editing controller creation
    final TextEditingController firstController = TextEditingController();
    final TextEditingController secondController = TextEditingController();

    // @override
    // void dispose() {
    //   // Clean up the controller when the widget is disposed.
    //   firstController.dispose();
    //   secondController.dispose();
    //   super.dispose();
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Calculator App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TextField(
              controller: firstController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter the first number',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TextField(
                controller: secondController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the second  number',
                ),
                keyboardType: TextInputType.number),
          ),
          //button for operation

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  //code of the operation here
                  double a = double.parse(firstController.text);
                  double b = double.parse(secondController.text);
                  result = a + b;
                  setState(() {
                    result = a + b;
                  });
                },
                child: const Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  //code of the operation here
                  double a = double.parse(firstController.text);
                  double b = double.parse(secondController.text);
                  result = a - b;
                  setState(() {
                    result = a - b;
                  });
                },
                child: const Text('Sub'),
              ),
              ElevatedButton(
                onPressed: () {
                  //code of the operation here
                  double a = double.parse(firstController.text);
                  double b = double.parse(secondController.text);
                  result = a * b;
                  setState(() {
                    result = a + b;
                  });
                },
                child: const Text('Mul'),
              ),
              ElevatedButton(
                onPressed: () {
                  //code of the operation here
                  double a = double.parse(firstController.text);
                  double b = double.parse(secondController.text);
                  result = a + b;
                  setState(() {
                    if (b != 0) {
                      result = a / b;
                    } else {
                      result = 0;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('You can not divide $a by 0'),
                        ),
                      );
                    }
                  });
                },
                child: const Text('div'),
              ),
            ],
          ),
          Text(
            'Result: $result',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),

          ElevatedButton(
            onPressed: () {
              setState(() {
                result = 0;
              });
            },
            child: const Text('Erase'),
          )
        ],
      ),
    );
  }
}
