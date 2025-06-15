import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/presentation/cubit/home_cubit/home_cubit_cubit.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubitCubit, HomeCubitState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          return Card(
            margin: const EdgeInsets.all(16),
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(state.homeEntity.imageAvatar),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.homeEntity.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text("Email: ${state.homeEntity.email}"),
                  Text("Password: ${state.homeEntity.password}"),
                  Text("Role: ${state.homeEntity.role}"),
                ],
              ),
            ),
          );
        } else if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeFailure) {
          log(state.errorMessage);
          return const Center(
            child: Text('Something went wrong. Please try again.***********'),
          );
        } else {
          return const Center(
            child: Text('Something went wrong. Please try again.'),
          );
        }
      },
    );
  }
}
