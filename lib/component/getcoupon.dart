import 'package:flutter/material.dart';

class CouponButton extends StatelessWidget {
  final bool isCouponClicked;
  final VoidCallback onTap;

  const CouponButton({
    Key? key,
    required this.isCouponClicked,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 70,
        decoration: BoxDecoration(
          color: isCouponClicked ? Colors.yellow : Colors.pinkAccent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            isCouponClicked ? 'Coupon received!' : 'Get coupon Sale 10%',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
