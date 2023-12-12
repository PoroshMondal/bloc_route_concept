import 'package:bloc_route_concept/route_access/anonymous_route_access/presentation/screens/anonymous_second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/counter_cubit.dart';
import '../../utils/utils.dart';

class AnonymousHomeScreen extends StatefulWidget {
  const AnonymousHomeScreen({
    super.key,
    this.title = "",
    this.color = Colors.blue
  });

  final String title;
  final Color color;

  /*@override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: const CounterView(),
    );
  }*/

  @override
  State<StatefulWidget> createState() {
    return _AnonymousHomeScreen(appTitle: this.title);
  }
}

class _AnonymousHomeScreen extends State<AnonymousHomeScreen> {
  final String appTitle;
  _AnonymousHomeScreen({required this.appTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appTitle),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have pushed the button this many times: ", style: Theme.of(context).textTheme.labelLarge,),
            const SizedBox(height: 5,),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented) {
                  Utils.mySnackBar(context, "Incremented");
                } else {
                  Utils.mySnackBar(context, "Decremented");
                }
              },

              builder: (context, state) {
                int value = state.counterValue;
                String txtData = "";
                if (value < 0) {
                  txtData = "Negative COUNTER VALUE: ${value.toString()}";
                } else if (value == 0) {
                  txtData = "COUNTER VALUE: ${value.toString()}";
                } else {
                  txtData = "Positive COUNTER VALUE: ${value.toString()}";
                }
                //return Text("COUNTER VALUE: ${state.counterValue.toString()}", style: Theme.of(context).textTheme.headlineMedium,);
                return Text(txtData, style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center,);
              },
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: (){
                    //BlocProvider.of<CounterCubitTwo>(context).decrement();
                    context.read<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),

                const SizedBox(height: 0, width: 10,),

                FloatingActionButton(
                  onPressed: (){
                    context.read<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                // ANONYMOUS ROUTE ACCESS
                Navigator.of(context).push(
                    MaterialPageRoute(
                      // error occurs because of context
                      // Instead of searching a HomeScreen context, it is searching for newContext
                      // to resolve it change the context name or (_)
                        /*builder: (context) => BlocProvider.value(
                          value: BlocProvider.of<CounterCubit>(context),
                          child: const AnonymousSecondScreen(title: "Second Screen", color: Colors.redAccent,),
                        )*/

                      // newContext or (_)
                      // passing the existing INSTANCE of BlocProvider
                        builder: (_) => BlocProvider.value(
                          value: BlocProvider.of<CounterCubit>(context),
                          child: const AnonymousSecondScreen(title: "Second Screen", color: Colors.redAccent,),
                        )

                      // It will create a new instance of CounterCubit
                      /*builder: (context) => BlocProvider.value(
                          value: CounterCubit(),
                          child: const AnonymousSecondScreen(title: "Second Screen", color: Colors.redAccent,),
                        )*/

                      // It will go to second screen
                      // error occurs because BlocProvider used in second screen
                      // and it will not found the BlocProvider instance
                        //builder: (context) => const AnonymousSecondScreen(title: "Second Screen", color: Colors.redAccent,)
                    )
                );

              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  side: const BorderSide(color: Colors.blue),
                  padding: const EdgeInsets.all(18),
                  textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: const Text("Go to Second screen"),
            )
          ],
        ),
      ),
    );
  }

}

