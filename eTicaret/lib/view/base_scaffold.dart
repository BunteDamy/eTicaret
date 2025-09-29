import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proje/components/custom_appbar.dart';
import 'package:proje/components/custom_bottom_nav_bar.dart';
import 'package:proje/riverpod/base_scafolld_riverport.dart';


final baseScafolldRiverport = ChangeNotifierProvider((ref) => BaseScafolldRiverport());


class BaseScaffold extends ConsumerStatefulWidget {
  const BaseScaffold({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends ConsumerState<BaseScaffold> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      bottomNavigationBar: CustomBottomNavBar(),
      body: ref.watch(baseScafolldRiverport).body()
    );
  }
}