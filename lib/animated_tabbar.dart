import 'package:flutter/material.dart';

class AnimatedTabBarWidget extends StatefulWidget {
  const AnimatedTabBarWidget({super.key, required this.onPageChanged});

  final ValueChanged<int> onPageChanged;

  @override
  State<AnimatedTabBarWidget> createState() => _AnimatedTabBarWidgetState();
}

class _AnimatedTabBarWidgetState extends State<AnimatedTabBarWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 36,
      decoration: BoxDecoration(
        color: const Color(0XFF3E436D),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left:
                _selectedIndex == 0 ? 0 : MediaQuery.of(context).size.width / 3,
            // Adjust the width properly
            right:
                _selectedIndex == 0 ? MediaQuery.of(context).size.width / 3 : 0,
            // Adjust the width properly
            top: 0,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Color(0XFF0066FF),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Row(
            children: List.generate(
              2,
              (index) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                    widget.onPageChanged(index);
                  },
                  child: Center(
                    child: Text(
                      index == 0 ? 'Open' : 'Settled',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        height: 24 / 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
