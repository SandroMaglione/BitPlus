import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/views/area_list_view.dart';
import 'package:bitplus/app/presentation/views/habit_list_view.dart';
import 'package:bitplus/app/presentation/views/info_view.dart';
import 'package:bitplus/app/presentation/widgets/custom_app_bar.dart';
import 'package:bitplus/app/presentation/widgets/custom_bottom_bar.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavigationIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<HabitListStatusBloc>(context).add(
      HabitListStatusEvent.habitListStatusGetHabitList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: '${DateFormat('EEEE').format(DateTime.now())}',
          subtitle: '${DateFormat('d MMMM y').format(DateTime.now())}',
          leftIcon: Icons.person_outline,
          leftAction: () {
            Navigator.of(context).pushNamed(
              Router.profileScreen,
            );
          },
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthUnauthenticated) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    Router.initLifeAreaScreen,
                    (_) => false,
                  );
                }
              },
            ),
          ],
          child: SafeArea(
            child: _displayNavigationScreen,
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          currentIndex: _bottomNavigationIndex,
          onTap: (index) => setState(() => _bottomNavigationIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.assessment,
              ),
              title: Text('Habits'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.accessibility_new,
              ),
              title: Text('Areas'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info,
              ),
              title: Text('Info'),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _displayNavigationScreen {
    switch (_bottomNavigationIndex) {
      case 0:
        return HabitListView();
      case 1:
        return AreaListView();
      case 2:
        return InfoView();
      default:
        return HabitListView();
    }
  }
}
