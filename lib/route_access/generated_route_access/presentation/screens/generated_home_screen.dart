import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/generated_counter_cubit.dart';
import '../../utils/utils.dart';
import 'generated_second_screen.dart';

class GeneratedHomeScreen extends StatefulWidget {
  const GeneratedHomeScreen({
    super.key,
    this.title = "",
    this.color = Colors.blue
  });

  final String title;
  final Color color;

  @override
  State<StatefulWidget> createState() {
    return _GeneratedHomeScreen(appTitle: this.title);
  }
}

class _GeneratedHomeScreen extends State<GeneratedHomeScreen> {
  final String appTitle;
  _GeneratedHomeScreen({required this.appTitle});

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
            BlocConsumer<GeneratedCounterCubit, GeneratedCounterState>(
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
                    //BlocProvider.of<GeneratedCounterCubitTwo>(context).decrement();
                    context.read<GeneratedCounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),

                const SizedBox(height: 0, width: 10,),

                FloatingActionButton(
                  onPressed: (){
                    context.read<GeneratedCounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                // Named ROUTE ACCESS
                Navigator.of(context).pushNamed('/second');
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
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                // Named, Generate and Global ROUTE ACCESS
                // calls are same that is pushNamed
                Navigator.of(context).pushNamed('/third');
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  side: const BorderSide(color: Colors.blue),
                  padding: const EdgeInsets.all(18),
                  textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: const Text("Go to Third screen"),
            ),
          ],
        ),
      ),
    );
  }

}

