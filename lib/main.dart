import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'blocs/counter_bloc.dart';
import 'cubits/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //* With this we can pass the counter value and the listener can listen to the changes
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
// final bloc = CounterCubit();

  final cubit = CounterCubit();

  @override
  void initState() {
    // prints the initial state
    print('Initial counter val: ${cubit.state.counterValue}');
    super.initState();
  }

  @override
  void dispose() {
    // closes the cubit after the app is closed
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.isIncremented) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Incremented !'),
                      duration: Duration(milliseconds: 300)));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Decremented !'),
                      duration: Duration(milliseconds: 300)));
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  //* this will be the stream which will change
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            // onPressed: cubit.,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 30),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: Icon(
              Icons.remove,
            ),
          ),
        ],
      ),
    );
  }

  void _decrementCounter() {
    // bloc.add(CounterEvent.Decrement);
    BlocProvider.of<CounterCubit>(context).decrement();
  }

  void _incrementCounter() {
    BlocProvider.of<CounterCubit>(context).increment();

    // bloc.add(CounterEvent.Increment);
  }
}

// Things that can't be done with //? "BlocBuilder" : (also listen's to the changes in the state but is called multiple times per state)
///? - Navigating to another screen can't be done, since it can call the build multiple times
///? - Calling dilog, snackbar etc..

///* BlocListener will listen to the changes in the state, but its called only one time/state (not including the initial state)

///! BlocConsumer - it combines both the "BlocBuilder" and "BlocListener"

/// RepositoryProvider - similar to BlocProvider just that it provides a unique instance of Repository
/// Repository - A repository is a class which has the "Main Functions" which helps Flutter communicate with Outer DataLayer, like
/// the internet, APIs, Db etc
 

///? > When we have multiple blocs to listen to the when will need - MultiBlocListener, MultiBlocProvider, MultiRepositoryProvider
