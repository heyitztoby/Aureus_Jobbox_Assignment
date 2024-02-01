import 'package:flutter/material.dart';
import '../../constants.dart' as constants;
import '../view/application/main_doc_uploading.dart';
import '../model/JobListingModel.dart';

class JobListingModal extends StatefulWidget {
  const JobListingModal({super.key, required this.jobListing});
  final JobListingModel jobListing;

  @override
  State<JobListingModal> createState() => _JobListingModalState();
}

class _JobListingModalState extends State<JobListingModal> {
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChanged);
  }

  // Initialising the height to snap for the bottom modal sheet.
  void _onChanged() {
    final currentSize = _controller.size;
    if (currentSize <= 0.05) _collapse();
  }

  void _collapse() => _animateSheet(sheet.snapSizes!.first);

  // Smoothen the animation for the snap.
  void _animateSheet(double size) {
    _controller.animateTo(
      size,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  DraggableScrollableSheet get sheet =>
      (_sheet.currentWidget as DraggableScrollableSheet);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return DraggableScrollableSheet(
        // Initialising the min, max and starting height of the modal sheet.
        key: _sheet,
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0,
        expand: false,
        snap: true,
        snapSizes: const [0, 0.7],
        controller: _controller,
        builder: (BuildContext context, ScrollController scrollController) {
          double deviceWidth = MediaQuery.of(context).size.width;

          return Theme(
              // Removing the divider line for the persistent bottom display.
              data: Theme.of(context).copyWith(
                  dividerTheme:
                      const DividerThemeData(color: Colors.transparent)),
              child: Scaffold(
                  body: BottomPopupSheet(
                      widget: widget,
                      deviceWidth: deviceWidth,
                      scrollController: scrollController),
                  persistentFooterButtons: const [
                    BottomButtons(),
                  ]));
        },
      );
    }));
  }
}

class BottomPopupSheet extends StatelessWidget {
  const BottomPopupSheet(
      {super.key,
      required this.widget,
      required this.deviceWidth,
      required this.scrollController});

  final JobListingModal widget;
  final double deviceWidth;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: constants.COLORS.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverList.list(
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: ShaderMask(
                    shaderCallback: (Rect rect) {
                      // Adding a fade gradient for text at the bottom.
                      return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [
                            0.0,
                            0.3,
                            0.5,
                            0.6,
                            0.7,
                            0.8,
                            1.0
                          ],
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.white
                          ]).createShader(rect);
                    },
                    blendMode: BlendMode.dstOut,
                    child: Column(
                      children: [
                        _companyLogo(),
                        _companyName(),
                        _jobTitle(),
                        _location(),
                        _jobDescriptionLabel(),
                        _jobDescription(),
                        _jobRequirementsLabel(),
                        _jobRequirements(),
                      ],
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }

  _companyLogo() {
    return Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.only(top: 20.0),
        child: Image(image: AssetImage(widget.jobListing.companyLogo)));
  }

  _companyName() {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: Text(
        widget.jobListing.companyName.toUpperCase(),
        textAlign: TextAlign.center,
        style: constants.STYLES.jobListingCompanyNameStyle,
      ),
    );
  }

  _jobTitle() {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: Text(
        widget.jobListing.jobTitle,
        textAlign: TextAlign.center,
        style: constants.STYLES.jobListingTitleStyle,
      ),
    );
  }

  _location() {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: Text(
        widget.jobListing.location,
        textAlign: TextAlign.center,
        style: constants.STYLES.jobListingInfoStyle,
      ),
    );
  }

  _jobDescriptionLabel() {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              constants.JOB_DESC_LABEL,
              textAlign: TextAlign.start,
              style: constants.STYLES.jdLabelStyle,
            ),
          ],
        ));
  }

  _jobDescription() {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      width: deviceWidth,
      child: Text(
        widget.jobListing.jobDescription,
        softWrap: true,
        style: constants.STYLES.jdStyle,
      ),
    );
  }

  _jobRequirementsLabel() {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              constants.JOB_REQ_LABEL,
              textAlign: TextAlign.start,
              style: constants.STYLES.jdLabelStyle,
            ),
          ],
        ));
  }

  _jobRequirements() {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      width: deviceWidth,
      child: Text(
        widget.jobListing.jobRequirements,
        textAlign: TextAlign.start,
        softWrap: true,
        style: constants.STYLES.jdStyle,
      ),
    );
  }
}

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            _applyButton(context),
            _bookmarkButton(),
          ],
        ),
      ),
    );
  }

  _applyButton(BuildContext context) {
    return Expanded(
        child: SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DocumentUploadingPage()));
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: constants.COLORS.primary,
            foregroundColor: constants.COLORS.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0))),
        child: _applyJobText(),
      ),
    ));
  }

  _applyJobText() {
    return const Text(
      constants.APPLY_JOB,
      style: constants.STYLES.normalButtonWordStyle,
    );
  }

  _bookmarkButton() {
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.only(left: 10.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: constants.COLORS.primaryLight3,
            foregroundColor: constants.COLORS.primary,
            elevation: 0,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0))),
        child: const Icon(
          Icons.bookmark_border_outlined,
          size: 28,
        ),
      ),
    );
  }
}
