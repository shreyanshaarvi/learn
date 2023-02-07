import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ContentManagementWidget extends StatefulWidget {
  const ContentManagementWidget({Key? key}) : super(key: key);

  @override
  _ContentManagementWidgetState createState() =>
      _ContentManagementWidgetState();
}

class _ContentManagementWidgetState extends State<ContentManagementWidget> {
  bool isMediaUploading = false;
  List<String> uploadedFileUrls = [];

  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final selectedMedia = await selectMedia(
            mediaSource: MediaSource.photoGallery,
            multiImage: true,
          );
          if (selectedMedia != null &&
              selectedMedia
                  .every((m) => validateFileFormat(m.storagePath, context))) {
            setState(() => isMediaUploading = true);
            var downloadUrls = <String>[];
            try {
              showUploadMessage(
                context,
                'Uploading file...',
                showLoading: true,
              );
              downloadUrls = (await Future.wait(
                selectedMedia.map(
                  (m) async => await uploadData(m.storagePath, m.bytes),
                ),
              ))
                  .where((u) => u != null)
                  .map((u) => u!)
                  .toList();
            } finally {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              isMediaUploading = false;
            }
            if (downloadUrls.length == selectedMedia.length) {
              setState(() => uploadedFileUrls = downloadUrls);
              showUploadMessage(context, 'Success!');
            } else {
              setState(() {});
              showUploadMessage(context, 'Failed to upload media');
              return;
            }
          }

          setState(() {
            FFAppState().image = uploadedFileUrls.map((e) => e).toList();
          });
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        elevation: 8,
        child: Icon(
          Icons.upload_sharp,
          color: FlutterFlowTheme.of(context).primaryColor,
          size: 24,
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.arrow_back_sharp,
          color: Color(0xFFCE4000),
          size: 24,
        ),
        title: Text(
          'Content Management',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                color: Color(0xFFCE4000),
                fontSize: 18,
                fontWeight: FontWeight.w600,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyText1Family),
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Column(
              children: [
                TabBar(
                  labelColor: Color(0xFFCE4000),
                  unselectedLabelColor:
                      FlutterFlowTheme.of(context).primaryText,
                  labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyText1Family,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText1Family),
                      ),
                  indicatorColor: FlutterFlowTheme.of(context).secondaryColor,
                  tabs: [
                    Tab(
                      text: 'Upload',
                    ),
                    Tab(
                      text: 'Draft',
                    ),
                    Tab(
                      text: 'Published',
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Builder(
                          builder: (context) {
                            final localImage = FFAppState().image.toList();
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.5,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: localImage.length,
                              itemBuilder: (context, localImageIndex) {
                                final localImageItem =
                                    localImage[localImageIndex];
                                return Material(
                                  color: Colors.transparent,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 155.7,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          localImageItem,
                                        ).image,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0.75),
                                      child: InkWell(
                                        onTap: () async {
                                          FFAppState().update(() {
                                            FFAppState().removeFromImage(
                                                localImageItem);
                                          });

                                          final imageCreateData =
                                              createImageRecordData(
                                            isDraft: true,
                                            imagePath: localImageItem,
                                          );
                                          await ImageRecord.collection
                                              .doc()
                                              .set(imageCreateData);
                                        },
                                        child: Icon(
                                          Icons.check_box,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: StreamBuilder<List<ImageRecord>>(
                          stream: queryImageRecord(
                            queryBuilder: (imageRecord) =>
                                imageRecord.where('is_draft', isEqualTo: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            List<ImageRecord> gridViewImageRecordList =
                                snapshot.data!;
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.5,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: gridViewImageRecordList.length,
                              itemBuilder: (context, gridViewIndex) {
                                final gridViewImageRecord =
                                    gridViewImageRecordList[gridViewIndex];
                                return Material(
                                  color: Colors.transparent,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 155.7,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          gridViewImageRecord.imagePath!,
                                        ).image,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0.75),
                                      child: InkWell(
                                        onTap: () async {
                                          final imageUpdateData =
                                              createImageRecordData(
                                            isPublished: true,
                                          );
                                          await gridViewImageRecord.reference
                                              .update(imageUpdateData);
                                        },
                                        child: Icon(
                                          Icons.check_box,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: StreamBuilder<List<ImageRecord>>(
                          stream: queryImageRecord(
                            queryBuilder: (imageRecord) => imageRecord
                                .where('is_published', isEqualTo: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            List<ImageRecord> gridViewImageRecordList =
                                snapshot.data!;
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.5,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: gridViewImageRecordList.length,
                              itemBuilder: (context, gridViewIndex) {
                                final gridViewImageRecord =
                                    gridViewImageRecordList[gridViewIndex];
                                return Material(
                                  color: Colors.transparent,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 155.7,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          gridViewImageRecord.imagePath!,
                                        ).image,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
