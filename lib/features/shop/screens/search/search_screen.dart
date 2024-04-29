import 'package:flutter/material.dart';
import 'package:food/features/shop/screens/store/widgets/search_bar.dart';
import 'package:food/utils/helpers/helper_functions.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: THelperFunctions.screenWidth(),
          height: THelperFunctions.screenHeight(),
          child: Column(
            children: [
              MySearchBar(
                searchController: searchController,
                searchHint: 'Search for your favourite dishes',
                filterFunction: () {},
                autoFocus: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
