import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Constantes.dart';
import 'package:note_app/Cubits/add_note_cubit/add_note_cubit.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({
    super.key,
  });

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color = kColors[index];

                setState(() {});
              },
              child: ColorsItem(
                color: kColors[index],
                isActive: currentIndex == index,
              ),
            );
          }),
    );
  }
}

class ColorsItem extends StatelessWidget {
  const ColorsItem({
    super.key,
    required this.color,
    required this.isActive,
  });
  final Color color;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0, 
      ),
      child: isActive
          ? CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 24,
              child: CircleAvatar(
                child: Icon(Icons.check,color: Colors.blue,size: 30,),
                radius: 20,
                backgroundColor: color,
              ),
            )
          : CircleAvatar(
              radius: 24,
              backgroundColor: color,
            ),
    );
  }
}
