import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sky_station/bloc/iss_bloc.dart';
import 'package:sky_station/bloc/iss_event.dart';
import 'package:sky_station/bloc/iss_state.dart';
import 'package:sky_station/constant/image_constant.dart';
import 'package:sky_station/main.dart';
import 'package:sky_station/widgets/internet_exception_widget.dart';
import 'package:sky_station/widgets/text_design_widget.dart';

import '../constant/text_style.dart';
import '../data/response/status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeScreen> {
  late IssBloc issBloc;

  @override
  void initState() {
    super.initState();
    issBloc = IssBloc(issRepository: getIt());
  }

  @override
  void dispose() {
    issBloc.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Sky Station Tracking'),
      ),
      body: BlocProvider(
        create: (_) => issBloc..add(IssDataFetched()),
        child: MultiBlocListener(
          listeners: [
            BlocListener<IssBloc, IssState>(
              listenWhen: (previous, current) =>
                  previous.issData.status != current.issData.status,
              listener: (context, state) {
                if (state.issData.status == Status.completed &&
                    state.issData.data != null) {
                  final issData = state.issData.data!;
                  issBloc.add(LocationFetched(
                    latitude: double.parse(issData.issPosition.latitude),
                    longitude: double.parse(issData.issPosition.longitude),
                  ));
                }
              },
            ),
          ],
          child: BlocBuilder<IssBloc, IssState>(
            buildWhen: (previous, current) =>
                previous.secondsRemaining != current.secondsRemaining ||
                previous.issData != current.issData,
            builder: (BuildContext context, state) {
              switch (state.issData.status) {
                case Status.loading:
                  return const Center(child: CircularProgressIndicator());
                case Status.error:
                  if(state.issData.message == ''){
                    return InterNetExceptionWidget(onPress: (){
                      issBloc.add(IssDataFetched());
                    });
                  }
                  return Center(child: Text(state.issData.message.toString()),);
                case Status.completed:
                  if (state.issData.data == null) {
                    return const Text('No Data Found');
                  }
                  final issData = state.issData.data!;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextTileWidget(
                        imagePath: ImageConstant.latLan,
                        title: 'Latitude',
                        value: issData.issPosition.latitude.toString(),
                      ),
                      TextTileWidget(
                        imagePath: ImageConstant.latLan,
                        title: 'Longitude',
                        value: issData.issPosition.longitude.toString(),
                      ),
                      TextTileWidget(
                        imagePath: ImageConstant.utcTime,
                        title: 'UTC Timestamp',
                        value: issData.timestamp.toString(),
                      ),
                      TextTileWidget(
                        imagePath: ImageConstant.localTime,
                        title: 'Local Time',
                        value: DateFormat('yyyy-MM-dd HH:mm:ss')
                            .format(DateTime.now()),
                      ),
                      if (state.locationName.status == Status.loading)
                        const CircularProgressIndicator()
                      else if (state.locationName.status == Status.completed)
                        Column(
                          children: [
                            TextTileWidget(
                                imagePath: ImageConstant.country,
                                title: 'Country',
                                value: state.locationName.data?.results[0]
                                        .country ??
                                    'Not found'),
                            TextTileWidget(
                                imagePath: ImageConstant.region,
                                title: 'Region',
                                value: state.locationName.data?.results[0]
                                        .addressLine1 ??
                                    'Not found'),
                          ],
                        ),
                      const SizedBox(height: 25),
                      Text(
                        'Your data will refresh automatically in'
                        ' ${state.secondsRemaining} seconds.',
                        style: AppStyle.font16weight500,
                      ),
                    ],
                  );
                default:
                  return const SizedBox();
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          issBloc.add(IssDataFetched());
        },
        tooltip: 'Refresh',
        backgroundColor: Colors.teal,
        splashColor: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(
          Icons.refresh,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
