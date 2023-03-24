import 'package:bloc_structure_doonamis/cubit/counter_cubit.dart';
import 'package:bloc_structure_doonamis/other_page.dart';
import 'package:bloc_structure_doonamis/widgets/new_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {
        if (state.counter == 2) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("Counter es ::::: ${state.counter}"),
                );
              });
        }

        if (state.counter == 5) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return OtherPage();
            }),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'Button 1',
                child: Icon(
                  Icons.add,
                  size: 40,
                ),
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();

                  print(state.counter);
                },
              ),
              SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                heroTag: 'Button 2',
                child: Icon(
                  Icons.remove,
                  size: 40,
                ),
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
              ),
            ],
          ),
          body: NewCount(
            onTap: () {
              print("object");
            },
            counter: state.counter,
          ),
        );
      },
    );
  }
}
