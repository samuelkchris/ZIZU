import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zizu/auth/auth_util.dart';
import 'package:zizu/backend/backend.dart';
import 'package:zizu/edit_profile/edit_profile_widget.dart';
import 'package:zizu/flutter_flow/flutter_flow_animations.dart';
import 'package:zizu/flutter_flow/flutter_flow_theme.dart';
import 'package:zizu/flutter_flow/flutter_flow_util.dart';
import 'package:zizu/login_page/login_page_widget.dart';

class ProfilePageWidget extends StatefulWidget {
  ProfilePageWidget({
    Key key,
    this.userProfile,
  }) : super(key: key);

  final DocumentReference userProfile;

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      slideOffset: Offset(0, -51),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: SpinKitPumpingHeart(
                color: FlutterFlowTheme.primaryColor,
                size: 40,
              ),
            ),
          );
        }
        final profilePageUsersRecord = snapshot.data;
        final timerecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.background,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 360,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.darkBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.primaryColor,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2, 2, 2, 2),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/UI_avatar_2@3x.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 44,
                                          height: 44,
                                          decoration: BoxDecoration(
                                            color:
                                                FlutterFlowTheme.darkBackground,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.background,
                                              width: 2,
                                            ),
                                          ),
                                          child: IconButton(
                                            onPressed: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditProfileWidget(
                                                    userProfile:
                                                        profilePageUsersRecord
                                                            .reference,
                                                  ),
                                                ),
                                              );
                                            },
                                            icon: Icon(
                                              Icons.edit_outlined,
                                              color: FlutterFlowTheme.grayLight,
                                              size: 24,
                                            ),
                                            iconSize: 24,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Container(
                                            width: 44,
                                            height: 44,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme
                                                  .darkBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.background,
                                                width: 2,
                                              ),
                                            ),
                                            child: IconButton(
                                              onPressed: () async {
                                                await signOut();
                                                await Navigator
                                                    .pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPageWidget(),
                                                  ),
                                                  (r) => false,
                                                );
                                              },
                                              icon: Icon(
                                                Icons.login_rounded,
                                                color: FlutterFlowTheme
                                                    .secondaryColor,
                                                size: 24,
                                              ),
                                              iconSize: 24,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    profilePageUsersRecord.displayName,
                                    style: FlutterFlowTheme.title3.override(
                                      fontFamily: 'Lexend Deca',
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: Text(
                                      profilePageUsersRecord.age.toString(),
                                      style:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Lexend Deca',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    profilePageUsersRecord.email,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Ailments',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: AutoSizeText(
                                      profilePageUsersRecord.ailments,
                                      style: FlutterFlowTheme.title3.override(
                                        fontFamily: 'Lexend Deca',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Next Challange',
                                        textAlign: TextAlign.start,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Text(
                                          dateTimeFormat(
                                              'yMMMd', timerecord.createdTime),
                                          style:
                                              FlutterFlowTheme.title1.override(
                                            fontFamily: 'Lexend Deca',
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Past Challanges',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: StreamBuilder<List<AppointmentsRecord>>(
                        stream: queryAppointmentsRecord(
                          queryBuilder: (appointmentsRecord) =>
                              appointmentsRecord.where('appointmentTime',
                                  isLessThan: getCurrentTimestamp),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: SpinKitPumpingHeart(
                                  color: FlutterFlowTheme.primaryColor,
                                  size: 40,
                                ),
                              ),
                            );
                          }
                          List<AppointmentsRecord>
                              listViewAppointmentsRecordList = snapshot.data;
                          // Customize what your widget looks like with no query results.
                          if (snapshot.data.isEmpty) {
                            return Material(
                              child: Container(
                                height: 100,
                                child: Center(
                                  child: Text('No results.'),
                                ),
                              ),
                            );
                          }
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewAppointmentsRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewAppointmentsRecord =
                                  listViewAppointmentsRecordList[listViewIndex];

                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.darkBackground,
                                      borderRadius: BorderRadius.circular(8),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 12, 12, 12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(4, 0, 0, 0),
                                                  child: Text(
                                                    listViewAppointmentsRecord
                                                        .appointmentType,
                                                    style: FlutterFlowTheme
                                                        .title3
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.chevron_right_rounded,
                                                color:
                                                    FlutterFlowTheme.grayLight,
                                                size: 24,
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme
                                                      .background,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 4, 8, 4),
                                                    child: Text(
                                                      dateTimeFormat(
                                                          'yMMMd',
                                                          listViewAppointmentsRecord
                                                              .appointmentTime),
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: FlutterFlowTheme
                                                            .textColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                                  child: Text(
                                                    'For',
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(4, 0, 0, 0),
                                                  child: Text(
                                                    listViewAppointmentsRecord
                                                        .appointmentName,
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: FlutterFlowTheme
                                                          .secondaryColor,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).animated(
                              [animationsMap['listViewOnPageLoadAnimation']]);
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
