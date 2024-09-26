import 'package:flutter/material.dart';

import '../constants/my_text_style.dart';

class AddMoreButton extends StatelessWidget {
  final Function()? onPressed;

  const AddMoreButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add),
        label: Text("Add", style: text14Style(),),
      ),
    );
  }
}
