import 'package:bloc_structure_doonamis/cubit/counter_cubit.dart';
import 'package:bloc_structure_doonamis/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'Button 1',
        onPressed: () {
          BlocProvider.of<CounterCubit>(context).increment();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return HomePage();
            }),
          );
        },
      ),
      appBar: AppBar(),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Center(
            child: Text("${state.counter}"),
          );
        },
      ),
    );
  }
}
