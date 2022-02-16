import 'package:flutter/material.dart';
import 'package:qfurniture/ui/shared/colors.dart';
import 'package:qfurniture/ui/shared/spacing.dart';
import 'package:qfurniture/ui/shared/text_styles.dart';

class ProductCounter extends StatefulWidget {
  const ProductCounter({Key? key, this.tiltle}) : super(key: key);
  final String? tiltle;

  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int _counter = 1;

  void _increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Opacity(
        opacity: _counter == 1 ? 0.5 : 1,
        child: CounterButton(
          onTap: _counter == 1 ? null : _decreaseCounter,
          title: '-',
        ),
      ),
      horizontalSpaceSmall,
      Text(
        _counter.toString(),
        style: AppStyle.kHeading3,
      ),
      horizontalSpaceSmall,
      CounterButton(
        onTap: _increaseCounter,
        title: '+',
      ),
    ]);
  }
}

class CounterButton extends StatelessWidget {
  const CounterButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: AppStyle.kHeading2.copyWith(
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
