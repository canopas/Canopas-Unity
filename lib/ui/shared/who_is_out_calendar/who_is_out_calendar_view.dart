import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectunity/ui/shared/who_is_out_calendar/bloc/who_is_out_view_bloc/who_is_out_view_event.dart';
import 'package:projectunity/ui/shared/who_is_out_calendar/bloc/who_is_out_view_bloc/who_is_out_view_state.dart';
import 'package:projectunity/widget/circular_progress_indicator.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../../../configs/colors.dart';
import '../../../configs/text_style.dart';
import '../../../configs/theme.dart';
import '../../../core/utils/const/leave_map.dart';
import '../../../core/utils/const/space_constant.dart';
import '../../../di/service_locator.dart';
import '../../../model/leave_application.dart';
import '../../../widget/calendar.dart';
import '../../../widget/user_profile_image.dart';
import 'bloc/who_is_out_calendar_bloc/who_is_out_calendar_bloc.dart';
import 'bloc/who_is_out_calendar_bloc/who_is_out_calendar_event.dart';
import 'bloc/who_is_out_view_bloc/who_is_out_view_bloc.dart';



class WhoIsOutCalendarViewProvider extends StatelessWidget {

  const WhoIsOutCalendarViewProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:  [
          BlocProvider(
            create: (_) => getIt<WhoIsOutCalendarBloc>(),
          ),
          BlocProvider(
            create: (_) => getIt<WhoIsOutViewBloc>()..add(WhoIsOutViewInitialLoadEvent()),
          ),
        ],
        child: const WhoIsOutCalendarView());
  }
}

class WhoIsOutCalendarView extends StatefulWidget {
  const WhoIsOutCalendarView({Key? key}) : super(key: key);

  @override
  State<WhoIsOutCalendarView> createState() => _WhoIsOutCalendarViewState();
}

class _WhoIsOutCalendarViewState extends State<WhoIsOutCalendarView> {

  @override
  Widget build(BuildContext context) {

    final localization = AppLocalizations.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(localization.leave_calendar_title),
        ),
        body: Column(
          children: [
            CalendarCard(
              calendar: TableCalendar(
                rangeSelectionMode: RangeSelectionMode.disabled,
                onDaySelected: (selectedDay, focusedDay){
                  context.read<WhoIsOutCalendarBloc>().add(WhoIsOutCalendarSelectDateEvent(selectedDay));
                  context.read<WhoIsOutViewBloc>().add(GetSelectedDateLeavesEvent(selectedDay));
                },
                onFormatChanged: (format) {
                  context.read<WhoIsOutCalendarBloc>().add(WhoIsOutCalendarFormatChangeEvent(format));
                },
                calendarFormat: context.watch<WhoIsOutCalendarBloc>().state.calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(context.watch<WhoIsOutCalendarBloc>().state.selectedDate, day);
                },
                focusedDay: context.watch<WhoIsOutCalendarBloc>().state.selectedDate,
                firstDay: DateTime(2020),
                lastDay: DateTime(2025),
                startingDayOfWeek: StartingDayOfWeek.sunday,
                calendarStyle: AppTheme.calendarStyle,
                headerStyle: AppTheme.calendarHeaderStyle,
                eventLoader: context.watch<WhoIsOutViewBloc>().getEvents,
              ),
              onVerticalSwipe: (swipe){
                context.read<WhoIsOutCalendarBloc>().add(WhoIsOutCalendarFormatChangeBySwipeEvent(swipe.index));
              },
            ),
            Expanded(
              child: BlocBuilder<WhoIsOutViewBloc,WhoIsOutViewState>(
                  builder: (context, state) {
                    if(state is WhoISOutViewLoadingState){
                      return const kCircularProgressIndicator();
                    } else if(state is WhoIsOutViewSuccessState && state.leaveApplications.isNotEmpty){
                      return ListView.separated(
                        padding: const EdgeInsets.all(primaryHorizontalSpacing),
                        itemBuilder: (BuildContext context, int index) => CalendarEmployeeLeaveCard(
                          leaveApplication: state.leaveApplications[index],
                          onTap: (){
                            context.read<WhoIsOutViewBloc>().add(WhoIsOutLeaveCardTapEvent(state.leaveApplications[index]));
                          },
                        ),
                        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: primaryVerticalSpacing,),
                        itemCount: state.leaveApplications.length,
                      );}
                    return Center(child: Text( localization.calendar_no_leave_msg(
                      context.watch<WhoIsOutCalendarBloc>().state.selectedDate
                    ),style: AppTextStyle.secondarySubtitle500,textAlign: TextAlign.center,));
                  }
              ),
            )
          ],
        )
    );
  }
}

class CalendarEmployeeLeaveCard extends StatelessWidget {
  final LeaveApplication leaveApplication;
  final void Function()? onTap;
  const CalendarEmployeeLeaveCard({Key? key,required this.leaveApplication, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: AppColors.primaryGray.withOpacity(0.60),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), topRight: Radius.circular(12)),
      ),
      child: Container(
        decoration:   BoxDecoration(
          border: Border(left: BorderSide(color: leaveRequestCardColor[leaveApplication.leave.leaveType]!,width: 5)),
        ),
        child: ListTile(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), topRight: Radius.circular(12)),
          ),
          onTap: onTap,
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          leading: ImageProfile(radius: 30,imageUrl: leaveApplication.employee.imageUrl),
          title: Text(leaveApplication.employee.name),
          subtitle: Text(leaveApplication.employee.employeeId),
        ),
      ),
    );
  }
}