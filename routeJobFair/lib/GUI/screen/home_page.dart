import 'package:flutter/material.dart';
import 'package:route_job_fair_flutter/GUI/screen/products_list.dart';
import 'package:route_job_fair_flutter/Bloc/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)  {
        return ProductBloc(context)..add(GetAllProducts());
      },
      child: const ProductsList(),
    );
  }
}
