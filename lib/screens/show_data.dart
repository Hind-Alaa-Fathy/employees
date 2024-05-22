import 'package:employees/shared_component/data_table.dart';
import 'package:employees/shared_component/text_in_app.dart';
import 'package:flutter/material.dart';
import '../shared_component/floating_action_button.dart';
import 'form_page.dart';

class ShowEmployeesData extends StatelessWidget {
  const ShowEmployeesData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      floatingActionButton: floatingActionButton(
        text: "Add New Employee",
        context: context,
        icon: Icons.add,
        page: const EmployeeFormPage()
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 15),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueGrey[500],
                  radius: 120,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/employees.jpg"),
                    radius: 110,),
                ),
                const SizedBox(height: 10,),
                textInApp(text: "Employees Data",color: Colors.blueGrey.shade700,fontWeight: FontWeight.bold,fontSize: 35),
                //employees table
                const Padding(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 40),
                  child: EmployeesTable(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
