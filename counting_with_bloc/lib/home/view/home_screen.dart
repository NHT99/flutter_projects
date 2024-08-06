import 'package:counting_with_bloc/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController inputController = TextEditingController();
  @override

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(

      builder: (context, state) {
        inputController = TextEditingController(text: state.input.toString());

        Future<void> addNumberDialog() {
          return showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return AlertDialog(
                    title: const Text('Basic dialog title'),
                    content: SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                context.read<HomeBloc>().add(DecreaseEvent());
                              },
                              icon: const Icon(Icons.remove)),
                          Expanded(
                            child: TextFormField(
                                controller: inputController,
                                onChanged: (value) {
                                  context.read<HomeBloc>().add(
                                      OnchangeNumberEvent(
                                          number: int.parse((value.isNotEmpty)
                                              ? value
                                              : "0")));
                                },
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter a number',
                                )),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  context.read<HomeBloc>().add(IncreaseEvent());
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
                          context.read<HomeBloc>().add(AddNumberEvent());
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
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
                        title: Text("Item ${state.result![index]}"),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: state.result!.length,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
