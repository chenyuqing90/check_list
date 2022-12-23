import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget{
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChenge;
  final Function(BuildContext)? settingTapped;
  final Function(BuildContext)? deleteTapped;


  const HabitTile({super.key,
    required this.habitName,
    required this.habitCompleted,
    required this.onChenge,
    required this.deleteTapped,
    required this.settingTapped,
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            //setting option
            SlidableAction(onPressed: settingTapped,
            backgroundColor: Colors.blueGrey,
            icon: Icons.settings,
            borderRadius: BorderRadius.circular(12),
            ),
            SlidableAction(onPressed: deleteTapped,
              backgroundColor: Colors.redAccent,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
            ),
            //delete option
          ],
        ),

        child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                //checkbox
                Checkbox(
                  value: habitCompleted,
                  onChanged: onChenge,
                ),
                Text(habitName, style: TextStyle(fontSize: 16),),
              ],
            )
        ),
      ),
    );
  }
}