import 'package:flutter/material.dart';
import 'controller_main_card.dart';

class MyMainCard extends StatefulWidget {
  final GameController controller;
  final bool inverted;
  final Color color;
  const MyMainCard({
    super.key, 
    required this.controller,
    required this.inverted,
    required this.color,
    });
  int getPlayer(){
    late int resp;
    inverted ? resp = 2 : resp = 1;
    return resp;
  }

  @override
  State<MyMainCard> createState() => _MyMainCardState();
}


class _MyMainCardState extends State<MyMainCard> {
  final TextStyle _myTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 20
  );

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return AnimatedBuilder(
      animation: widget.controller,
      builder: (_, _) {
        final card = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 45),
          child: Container(
            height: mq.size.height * 0.36,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                begin: AlignmentGeometry.topCenter,
                end: AlignmentGeometry.bottomCenter,
                colors: [
                  widget.color,
                  widget.color,
                  Color(0xFF141414),
                ],
                stops: [0.0,0.98,1.0]
              )
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 8),
                    Text('HIGHTEST : ${widget.controller.highScore}', style: _myTextStyle),
                    const Spacer(),
                    Text('P${widget.getPlayer()} SCORE : ${widget.controller.score}', style: _myTextStyle),
                    SizedBox(width: 8),
                  ],
                ),
                Expanded(
                  child: _SquareGrid(
                    activeStates: widget.controller.activeStates,
                    onTap: widget.controller.handleTap,
                    tapedId: widget.controller.tapedId,
                  ),
                ),
               
              ],
            ),
          ),
        );
        return widget.inverted ? RotatedBox(quarterTurns: 2, child: card,) : card; // 2 == 180 graus
      },
    );
  }
}

class _SquareGrid extends StatelessWidget {
  final Function(int) onTap;
  final int? tapedId;
  final List<bool> activeStates;

  const _SquareGrid({
    required this.onTap,
    required this.activeStates,
    required this.tapedId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(2, (row) {
        return Expanded(
          
          child: Row(
            children: List.generate(3, (col) {
              int index =
                  row * 3 + col; //retorna id em sequencia 1,2,3,4,5,6

              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                  child: _SquareCard(
                    id: index,
                    isActive: activeStates[index],
                    onTap: () => onTap(index),
                    tapedId: tapedId,
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}

class _SquareCard extends StatelessWidget {
  final int? id;
  final bool isActive;
  final int? tapedId;
  final VoidCallback onTap;

  const _SquareCard({
    required this.id,
    required this.isActive, 
    required this.onTap, 
    this.tapedId
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            color: 
              isActive && tapedId == id ? Color.fromARGB(255, 55, 105, 8)
              : isActive ?  Color.fromARGB(255, 122, 211, 38)
              : Color.fromARGB(255, 12, 12, 12),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white,
              width: 0.5
            )
          ),
        ),
      ),
    );
  }
}
