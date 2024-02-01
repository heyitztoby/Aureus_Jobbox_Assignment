import 'package:aureus_jobbox/view/shared_widgets/widget_spacer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart' as constants;
import '../../provider/image_change_provider.dart';
import '../../provider/user_profile_provider.dart';
import '../shared_widgets/widget_file_selected.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const UserProfileImage(),
                ),
              ],
            ),
            WidgetSpacer(
              height: 20.0,
            ),
            const ContactInfoRow(),
            WidgetSpacer(height: 20.0),
            const UserContactInformation(),
            WidgetSpacer(height: 5.0),
            const Divider(
              color: constants.COLORS.grey,
              thickness: 0.2,
            ),
            WidgetSpacer(height: 5.0),
            const EmploymentInfoRow(),
            WidgetSpacer(height: 15.0),
            _resumeLabel(),
            WidgetSpacer(height: 5.0),
            const WidgetFileSelected(fileType: 'Resume'),
            WidgetSpacer(height: 10.0),
            _coverLetterLabel(),
            WidgetSpacer(
              height: 5.0,
            ),
            const WidgetFileSelected(fileType: 'Cover Letter'),
            WidgetSpacer(height: 10.0),
          ],
        ),
      ),
    );
  }

  _resumeLabel() {
    return const Text(constants.RESUME_LABEL,
        style: constants.STYLES.infoLabelsStyle);
  }

  _coverLetterLabel() {
    return const Text(constants.COVER_LETTER_LABEL,
        style: constants.STYLES.infoLabelsStyle);
  }
}

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageChangeProvider>(
        builder: (context, imageChangeProvider, child) {
      return Stack(
        children: [
          _imageDisplay(imageChangeProvider),
          _plusButton(imageChangeProvider)
        ],
      );
    });
  }

  _imageDisplay(ImageChangeProvider imageChangeProvider) {
    final String imageString = imageChangeProvider.imageString;

    return ClipRRect(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(75),
              border: Border.all(
                  // Conditional check to display different border color if there is no profile image.
                  color: imageString.compareTo('') == 0
                      ? constants.COLORS.grey
                      : Colors.transparent)),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(75),
              image: DecorationImage(
                image: NetworkImage(imageString),
                fit: BoxFit.fill,
              ),
            ),
            child: Align(
              child: Container(
                  // Conditional check to display a default value if there is no profile image.
                  child: imageString.compareTo("") == 0
                      ? const Text(constants.NO_PHOTO_LABEL,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: constants.STYLES.labelStyle)
                      : const Text('')),
            ),
          ),
        )
      ]),
    );
  }

  _plusButton(ImageChangeProvider imageChangeProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 100,
            width: 100,
            padding: const EdgeInsets.only(top: 70.0, left: 75.0),
            child: ElevatedButton(
                onPressed: () => {
                      // Changing the photo just for demo purposes.
                      imageChangeProvider.setImageString(
                          "https://thumbs.dreamstime.com/b/seascape-over-under-sea-cloudy-sky-rocky-seabed-seascape-over-under-sea-surface-cloudy-blue-sky-rocky-seabed-underwater-108661258.jpg")
                    },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    backgroundColor:
                        MaterialStateProperty.all(constants.COLORS.darkBrown),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    side: MaterialStateProperty.all(const BorderSide(
                        width: 1, color: constants.COLORS.white))),
                child: const Icon(
                  Icons.add,
                  color: constants.COLORS.white,
                  size: 15,
                ))),
      ],
    );
  }
}

class ContactInfoRow extends StatelessWidget {
  const ContactInfoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [_contactInfoLabel(), _editButton()],
    );
  }

  _contactInfoLabel() {
    return const Expanded(
      child: Text(
        constants.CONTACT_INFO,
        style: constants.STYLES.jobApplicationLabel,
      ),
    );
  }

  _editButton() {
    return IconButton(
      icon: const Icon(
        Icons.edit,
        color: constants.COLORS.black,
      ),
      onPressed: () => {},
    );
  }
}

class UserContactInformation extends StatelessWidget {
  const UserContactInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProfileProvider>(
      builder: (context, userProfileProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _fullNameLabel(),
            WidgetSpacer(height: 5.0),
            _userFullName(userProfileProvider),
            WidgetSpacer(height: 15.0),
            _emailLabel(),
            WidgetSpacer(height: 5.0),
            _userEmail(userProfileProvider),
            WidgetSpacer(height: 15.0),
            _mobileNumberLabel(),
            WidgetSpacer(height: 5.0),
            _userMobileNumber(userProfileProvider),
          ],
        );
      },
    );
  }

  _fullNameLabel() {
    return const Text(
      constants.FULL_NAME_LABEL,
      style: constants.STYLES.infoLabelsStyle,
    );
  }

  _userFullName(UserProfileProvider userProfileProvider) {
    return Text(
      userProfileProvider.fullName,
      style: constants.STYLES.inputStyle,
    );
  }

  _emailLabel() {
    return const Text(
      constants.EMAIL_LABEL,
      style: constants.STYLES.infoLabelsStyle,
    );
  }

  _userEmail(UserProfileProvider userProfileProvider) {
    return Text(
      userProfileProvider.email,
      style: constants.STYLES.inputStyle,
    );
  }

  _mobileNumberLabel() {
    return const Text(
      constants.MOBILE_NUMBER_LABEL,
      style: constants.STYLES.infoLabelsStyle,
    );
  }

  _userMobileNumber(UserProfileProvider userProfileProvider) {
    return Text(
      userProfileProvider.mobileNumber,
      style: constants.STYLES.inputStyle,
    );
  }
}

class EmploymentInfoRow extends StatelessWidget {
  const EmploymentInfoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _employmentInfoLabel(),
        _editButton(),
      ],
    );
  }

  _employmentInfoLabel() {
    return const Expanded(
      child: Text(
        constants.EMPLOYMENT_INFO,
        style: constants.STYLES.jobApplicationLabel,
      ),
    );
  }

  _editButton() {
    return IconButton(
      icon: const Icon(
        Icons.edit,
        color: constants.COLORS.black,
      ),
      onPressed: () => {},
    );
  }
}
