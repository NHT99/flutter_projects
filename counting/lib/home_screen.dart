import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int>? result;
  TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result = [];
    inputController.text = "0";
  }

  @override
  Widget build(BuildContext context) {
    Future<void> addNumberDialog() {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Basic dialog title'),
            content: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        if (inputController.text.isEmpty) {
                          return;
                        }
                        final inputValue = int.parse(inputController.text);
                        if (inputValue == 0) {
                          return;
                        }
                        setState(() {
                          inputController.text = (inputValue - 1).toString();
                        });
                      },
                      icon: const Icon(Icons.remove)),
                  Expanded(
                    child: TextField(
                        controller: inputController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter a number',
                        )),
                  ),
                  IconButton(
                      onPressed: () {
                        if (inputController.text.isEmpty) {
                          return;
                        }
                        final inputValue = int.parse(inputController.text);
                        setState(() {
                          inputController.text = (inputValue + 1).toString();
                        });
                      },
                      icon: const Icon(Icons.add)),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Add'),
                onPressed: () {
                  if (inputController.text.isEmpty) {
                    return;
                  }
                  final inputValue = int.parse(inputController.text);
                  setState(() {
                    result!.add(inputValue);
                  });
                  inputController.text = "0";
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("Home Screen"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNumberDialog();
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Welcome to Home Screen",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "History",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.separated(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Item ${result![index]}"),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: result!.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
