import 'package:counter_bloc_app/cubit/counter_cubit.dart';
import 'package:counter_bloc_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'helper/cubit_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext ctx) => CounterCubit(),
        child: BlocConsumer<CounterCubit, CounterStates>(
          listener: (ctx, state) {},
          builder: (ctx, state) => Scaffold(
            appBar: AppBar(
              title: Text('Counter Bloc '),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      CounterCubit.get(ctx).minus();
                    },
                    child: Text(
                      'minus',
                      
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Text(
                    "${CounterCubit.get(ctx).counter}",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  TextButton(
                    onPressed: () {
                      CounterCubit.get(ctx).plus();
                    },
                    child: Text(
                      'plus',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
