import 'package:flutter/material.dart';

/* TEXT CONSTANTS */
const String EMAIL_LABEL = "Email";
const String PASSWORD_LABEL = "Password";
const String NEW_PASSWORD_LABEL = "New Password";
const String RETYPE_PASSWORD_LABEL = "Re-type Password";
const String EMAIL_HINT_TEXT = "example@mail.com";
const String PASSWORD_HINT_TEXT = "••••••••";
const String FORGOT_PASSWORD = "Forgot Password?";
const String LOGIN_LABEL = "Login";
const String LOGIN_LABEL2 = "Log In";
const String SIGNUP_LABEL = "Sign Up";
const String NO_ACCOUNT_LABEL = "Don\'t have an account?";
const String CREATE_ACCOUNT = "Create Account";
const String EXISTING_ACCOUNT_LABEL = "Already have an account?";
const String ADD_PHOTO_LABEL = "Add Photo";
const String NO_PHOTO_LABEL = "No Photo";
const String TERMS_CONDITIONS = "By creating an account, you agree to Koko's\n";
const String TERMS_USE = "Terms of Use";
const String PRIVACY_POLICY = "Privacy Policy.";
const String WELCOME_MESSAGE = "Hi ";
const String WAVE_HAND_EMOJI = "👋";
const String SLOGAN = "Find The Best Job Here!";
const String JOB_SEARCH_BAR_HINT = "Start searching for jobs";
const String RECENT_JOBS = "Recent Jobs";
const String NEAR_YOU = "Near You";
const String JOB_LISTINGS = "Job Listings";
const String APPLIED_JOBS = "Applied Jobs";
const String PROFILE = "Profile";
const String JOB_DESC_LABEL = "Job Description";
const String JOB_REQ_LABEL = "Requirements";
const String APPLY_JOB = "Apply This Job";
const String UPLOADING_DOCS = "Uploading of Documents";
const String RESUME_LABEL = "Resume";
const String RESUME_DESC = "Remember to include your most updated resume";
const String COVER_LETTER_LABEL = "Cover Letter";
const String COVER_LETTER_DESC = "Stand out with your cover letter";
const String PROCEED = "Proceed";
const String SUBMIT = "Submit";
const String EMPLOYMENT_INFO = "Employment Information";
const String EDUCATION_LABEL = "Education";
const String RESUME_SWITCH_LABEL = "Included in Resume";
const String SCHOOL_NAME = "Name of school";
const String STUDY_COURSE = "Course of study";
const String GRADUATE_YEAR = "Year graduated";
const String WORK_EXP_LABEL = "Work Experience";
const String ADDITIONAL_SKILLS_LABEL = "Additional Skills";
const String REVIEW_INFO = "Review Information";
const String CONTACT_INFO = "Contact Info";
const String FULL_NAME_LABEL = "Full Name";
const String MOBILE_NUMBER_LABEL = "Mobile Number";

/* COLOR CONSTANTS */
class COLORS {
  static const Color primary = Color(0xFFEA9E5B);
  static const Color primaryLight = Color(0xFFEEA96D);
  static const Color primaryLight2 = Color(0XFFC48D5D);
  static const Color primaryLight3 = Color(0xFFFFF5EC);
  static const Color primaryLight4 = Color(0xFFFFE3CB);
  static const Color bgColor = Color(0XFFFCF8F5);
  static const Color grey = Color(0xFFA59E97);
  static const Color greyLight = Color(0xFFC9C2BD);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color darkBrown = Color(0xFF4D3B2D);
}

/* SIZE CONSTANTS */
class FONTS {
  static const xs = 12.0;
  static const sm = 14.0;
  static const med = 16.0;
  static const lg = 18.0;
  static const xlg = 20.0;
  static const header = 24.0;
}

/* FONT TYPE CONSTANTS */
class FONTFAMILY {
  static const Oswald = 'Oswald';
  static const Autour = 'AutourOne';
  static const Poppins = 'Poppins';
}

/* FONT WEIGHT CONSTANTS */
class POPPINS {
  static const light = FontWeight.w300;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semibold = FontWeight.w600;
  static const bold = FontWeight.w700;
}

/* STYLING CONSTANTS */
class STYLES {
  static const inputStyle = TextStyle(
      color: COLORS.black,
      fontFamily: FONTFAMILY.Poppins,
      fontSize: FONTS.med,
      fontWeight: POPPINS.regular);
  static const hintStyle = TextStyle(
      color: COLORS.greyLight,
      fontFamily: FONTFAMILY.Poppins,
      fontSize: FONTS.med,
      fontWeight: POPPINS.regular);
  static const labelStyle = TextStyle(
      color: COLORS.darkBrown,
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.regular,
      fontSize: FONTS.med);
  static const smallDarkTextStyle = TextStyle(
      color: COLORS.darkBrown,
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.regular,
      fontSize: FONTS.xs);
  static const smallPrimaryTextStyle = TextStyle(
      color: COLORS.primary,
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.regular,
      fontSize: FONTS.xs);
  static const welcomeTextStyle = TextStyle(
      color: COLORS.darkBrown,
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.medium,
      fontSize: FONTS.sm);
  static const normalButtonWordStyle = TextStyle(
      color: COLORS.white,
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.semibold,
      fontSize: FONTS.med);
  static const textButtonStyle = TextStyle(
      color: COLORS.primary,
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.semibold,
      fontSize: FONTS.med);
  static const jobListingCompanyNameStyle = TextStyle(
      color: COLORS.primary,
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.medium,
      fontSize: FONTS.xs,
      letterSpacing: 1.5);
  static const jobListingTitleStyle = TextStyle(
      color: COLORS.darkBrown,
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.semibold,
      fontSize: FONTS.xlg);
  static const jobListingDateStyle = TextStyle(
      color: COLORS.greyLight,
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.regular,
      fontSize: FONTS.xs);
  static const jobListingInfoStyle = TextStyle(
      color: COLORS.greyLight,
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.regular,
      fontSize: FONTS.sm);
  static const headerStyle = TextStyle(
      color: COLORS.darkBrown,
      fontFamily: FONTFAMILY.Autour,
      fontSize: FONTS.xlg,
      letterSpacing: -1.5);
  static const welcomeSloganStyle = TextStyle(
      color: COLORS.darkBrown,
      fontFamily: FONTFAMILY.Autour,
      fontSize: FONTS.header,
      letterSpacing: -1.5);
  static const jdLabelStyle = TextStyle(
      color: COLORS.darkBrown,
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.semibold,
      fontSize: FONTS.med,
      letterSpacing: -0.3);
  static const jdStyle = TextStyle(
      color: COLORS.darkBrown,
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.medium,
      fontSize: FONTS.med,
      letterSpacing: -0.2,
      height: 2);
  static const jobApplicationLabel = TextStyle(
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.semibold,
      color: COLORS.darkBrown,
      fontSize: FONTS.xlg,
      letterSpacing: -1.0);
  static const jobApplicationDescText = TextStyle(
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.medium,
      color: COLORS.grey,
      fontSize: FONTS.xs,
      letterSpacing: -0.2);
  static const progressBarText = TextStyle(
      color: COLORS.primary,
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.regular,
      fontSize: FONTS.sm);
  static const includedTextStyle = TextStyle(
      color: COLORS.black,
      fontFamily: FONTFAMILY.Poppins,
      fontSize: FONTS.sm,
      fontWeight: POPPINS.regular,
      letterSpacing: -0.5);
  static const jobApplicationInputLabel = TextStyle(
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.regular,
      color: COLORS.black,
      fontSize: FONTS.med,
      letterSpacing: -0.2);
  static const infoLabelsStyle = TextStyle(
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.regular,
      color: COLORS.grey,
      fontSize: FONTS.med,
      letterSpacing: -0.2);
  static const appliedJobLabelStyle = TextStyle(
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.regular,
      color: COLORS.grey,
      fontSize: FONTS.sm,
      letterSpacing: -0.2);
  static const numberOfAppliedJobsStyle = TextStyle(
      fontFamily: FONTFAMILY.Poppins,
      fontWeight: POPPINS.semibold,
      color: COLORS.grey,
      fontSize: FONTS.sm,
      letterSpacing: -0.2);
}
