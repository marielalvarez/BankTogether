import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_settings_model.dart';
export 'notifications_settings_model.dart';

class NotificationsSettingsWidget extends StatefulWidget {
  const NotificationsSettingsWidget({super.key});

  @override
  State<NotificationsSettingsWidget> createState() =>
      _NotificationsSettingsWidgetState();
}

class _NotificationsSettingsWidgetState
    extends State<NotificationsSettingsWidget> {
  late NotificationsSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsSettingsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.pop();
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: Color(0x000F0F0F),
            size: 32.0,
          ),
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'sc4ff4ce' /* Notificaciones */,
          ),
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                fontFamily: 'Sora',
                letterSpacing: 0.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: Image.asset(
              'assets/images/login_bg@2x.png',
            ).image,
          ),
        ),
        child: StreamBuilder<UsersRecord>(
          stream: UsersRecord.getDocument(currentUserReference!),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }

            final columnUsersRecord = snapshot.data!;

            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: SwitchListTile.adaptive(
                    value: _model.switchListTileValue1 ??= true,
                    onChanged: (newValue) async {
                      safeSetState(
                          () => _model.switchListTileValue1 = newValue!);
                    },
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'gjygkr0n' /* Activar Notificaciones */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Sora',
                                letterSpacing: 0.0,
                              ),
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        '3y3yhxbk' /* Reciba notificaciones push de ... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    activeColor: FlutterFlowTheme.of(context).tertiary,
                    activeTrackColor: Color(0xFFE70513),
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                  ),
                ),
                SwitchListTile.adaptive(
                  value: _model.switchListTileValue2 ??= true,
                  onChanged: (newValue) async {
                    safeSetState(() => _model.switchListTileValue2 = newValue!);
                  },
                  title: Text(
                    FFLocalizations.of(context).getText(
                      '1ytebj35' /* Notificaciones de Correo */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Sora',
                          letterSpacing: 0.0,
                        ),
                  ),
                  subtitle: Text(
                    FFLocalizations.of(context).getText(
                      '9lvh5nst' /* Reciba notificaciones por corr... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  activeColor: FlutterFlowTheme.of(context).tertiary,
                  activeTrackColor: Color(0xFFE70513),
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                ),
                SwitchListTile.adaptive(
                  value: _model.switchListTileValue3 ??= true,
                  onChanged: (newValue) async {
                    safeSetState(() => _model.switchListTileValue3 = newValue!);
                  },
                  title: Text(
                    FFLocalizations.of(context).getText(
                      '69d2j74u' /* Localicación de Servicos */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Sora',
                          letterSpacing: 0.0,
                        ),
                  ),
                  subtitle: Text(
                    FFLocalizations.of(context).getText(
                      '3k8cuv0d' /* Permítanos rastrear su ubicaci... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  activeColor: FlutterFlowTheme.of(context).tertiary,
                  activeTrackColor: Color(0xFFE70513),
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pop();
                    },
                    text: FFLocalizations.of(context).getText(
                      'isgrgbfs' /* Guardar Cambios */,
                    ),
                    options: FFButtonOptions(
                      width: 190.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFFE70513),
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
