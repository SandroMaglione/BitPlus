import 'package:bitplus/app/presentation/bloc/bloc.dart';
import 'package:bitplus/app/presentation/views/area_list_view.dart';
import 'package:bitplus/app/presentation/views/habit_list_view.dart';
import 'package:bitplus/app/presentation/views/info_view.dart';
import 'package:bitplus/app/presentation/widgets/custom_app_bar.dart';
import 'package:bitplus/core/router/router.gr.dart';
import 'package:bitplus/core/theme/colors.dart';
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
          leftAction: () => _signOut(context),
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
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _bottomNavigationIndex,
            selectedItemColor: ACCENT_COLOR_DARK,
            unselectedItemColor: ACCENT_COLOR_DARK.withOpacity(0.56),
            backgroundColor: WHITE,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: (index) => setState(() => _bottomNavigationIndex = index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.inbox,
                ),
                title: Text('Habits'),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                ),
                title: Text('Areas'),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.share,
                ),
                title: Text('Share'),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.info_outline,
                ),
                title: Text('Info'),
              ),
            ],
          ),
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
      case 3:
        return InfoView();
      default:
        return HabitListView();
    }
  }

  void _signOut(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(
      AuthEvent.authSignOut(),
    );
  }
}
