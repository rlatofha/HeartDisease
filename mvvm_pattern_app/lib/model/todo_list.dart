import 'package:flutter/material.dart';

class TodoList{
 
  String date;

  String runhealth = '';
  String swimhealth = '';
  String hikehealth = '';
  String cycclehealth = '';

  String health_time = ''; 
  
  String brofood= '';
  String salfood = '';
  String galfood = '';
  String nutfood = '';

  String broamount= '';
  String salamount = '';
  String galamount = '';
  String nutamount = '';

  String tabaco = '';

  String tabaco_amount = '';

  //Construtor
  TodoList({
    required this.date, required this.runhealth, required this.swimhealth, required this.hikehealth, required this.cycclehealth, required this.health_time,
    required this.brofood, required this.salfood, required this.galfood, required this.nutfood, required this.broamount,
    required this.salamount, required this.galamount, required this.nutamount, required this.tabaco, required this.tabaco_amount
  });

  

}