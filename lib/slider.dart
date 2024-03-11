import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newaaaa/Provider/model.dart';
import 'package:newaaaa/Provider/sli.dart';
import 'package:provider/provider.dart';

class SliderView extends StatefulWidget {
  const SliderView({super.key});

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  @override
  Widget build(BuildContext context) {
    print('wrong');
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<SliderChange>(
              builder: (context, value, child) {
                print('right 2');
                return Slider(
                  onChanged: (val) {
                    value.increment(val);
                  },
                  value: value.counter,
                  min: 0,
                  max: 1,
                );
              },
            ),
            Consumer<SliderChange>(
              builder: (context, value, child) {
                print('right 1');
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 90,
                        color: Colors.green.withOpacity(value.counter),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 90,
                        color: Colors.red.withOpacity(value.counter),
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
