import 'package:flutter/material.dart';
import 'package:customized_text_field/customized_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomTextFieldExample(),
    );
  }
}

class CustomTextFieldExample extends StatefulWidget {
  const CustomTextFieldExample({Key? key}) : super(key: key);

  @override
  State<CustomTextFieldExample> createState() => _CustomTextFieldExampleState();
}

class _CustomTextFieldExampleState extends State<CustomTextFieldExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpandingTextField(
              unfocusedFieldSize: MediaQuery.of(context).size.width * 0.6,
              focusedFieldSize: MediaQuery.of(context).size.width - 100,
            ),
            ExpandingTextFormField(
              unfocusedFieldSize: 150,
              focusedFieldSize: MediaQuery.of(context).size.width,
              autoValidateMode: AutovalidateMode.always,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Cannot be empty';
                }
                return null;
              },
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Hello There'),
                ),
                Expanded(
                  child: TextFormField(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
