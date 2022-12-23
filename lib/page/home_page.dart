import 'package:check_list/components/fab_btn.dart';
import 'package:check_list/components/habit_tile.dart';
import 'package:check_list/components/new_habit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  //data structure for list
  List todayList = [
    //[habitName, habitComplete]
    ['行動APP課程：繳交期末考作業', false],
    ['企業倫理：下周四報告', false],
    ['1/2起：期末考試週', false],
  ];

  //when checkbox was tapped
  void checkBoxTapped(bool? value, int index){
    setState(() {
      todayList[index][1] = value;
    });
  }

  //create new todolist
  final _NewHabitNameController = TextEditingController();
  void CreateNewHabit(){
    //show alert dialog
    showDialog(
        context: context,
        builder: (context){
          return EnterNewHabit(
            controller: _NewHabitNameController,
            onSave: saveNewHabit,
            onCancel: cancelNewHabit,
            hintText: 'Enter todo name',
          );
        }
    );
  }

  //save new habit
  void saveNewHabit(){
    //add
    setState(() {
      todayList.add([_NewHabitNameController.text, false]);
    });

    //clean textfield
    _NewHabitNameController.clear();
    Navigator.of(context).pop();
  }

  //cancel new habit
  void cancelNewHabit(){
    //clean textfield
    _NewHabitNameController.clear();
    Navigator.of(context).pop();
  }

  //open setting habit
  void openHabitSetting(int index){
    showDialog(context: context, builder: (context){
      return EnterNewHabit(
          hintText: todayList[index][0],
          onSave: () => saveExistingHabit(index),
          onCancel: cancelNewHabit,
          controller: _NewHabitNameController);
    });
  }

  //save ExistingHabit with new name
  void saveExistingHabit(int index){
    setState(() {
      todayList[index][0] = _NewHabitNameController.text;
    });
    Navigator.pop(context);
  }

  //delete Habit
  void deleteHabit(int index){
    setState(() {
      todayList.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo List for School",
          style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatActionButton(onPressed: CreateNewHabit),
      body: ListView.builder(
        itemCount: todayList.length,
          itemBuilder: (context , index){
            return HabitTile(
                habitName: todayList[index][0],
                habitCompleted: todayList[index][1],
                onChenge: (value) => checkBoxTapped(value, index),
                settingTapped: (context) => openHabitSetting(index),
                deleteTapped: (context) => deleteHabit(index),
            );
           })
    );
  }
}