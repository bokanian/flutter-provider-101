import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

//HOME PAGE MAIN PAGE
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Container2(),
          ),
          body: Column(
            children: [
              Container1(),
            ],
          ),
        ),
      ),
    );
  }
}

//INPUT TEXT FIELD
class NewTextInput extends StatefulWidget {
  static TextEditingController _ageController = TextEditingController();

  @override
  _NewTextInputState createState() => _NewTextInputState();
}

class _NewTextInputState extends State<NewTextInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: NewTextInput._ageController,
          decoration: InputDecoration(
            labelText: 'type...',
          ),
          onChanged: (value) {
            Provider.of<Data>(context, listen: false).changeText(value);
          },
        ),
      ],
    );
  }
}

// Container 1
class Container1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 4,
          child: ListTile(
            title: Text(Provider.of<Data>(context).user),
            subtitle: Text(Provider.of<Data>(context).user),
          ),
        ),
        NewTextInput(),
      ],
    );
  }
}

//Container 2
class Container2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).user);
  }
}

class Data extends ChangeNotifier {
  String user = 'Aliz Bk29';

  void changeText(String newText) {
    user = newText;
    notifyListeners();
  }
}
