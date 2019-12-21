const String ERROR_GET_LOCAL_USER =
    "A problem occurred while getting local user, try again later";
const String ERROR_SAVE_LOCAL_USER =
    "A problem occurred while saving local user, try again later";
const String ERROR_REMOVE_LOCAL_USER =
    "A problem occurred while logging out local user, try again later";

const String ERROR_SIGN_IN_EMAIL = "A problem occured on sign in, try again";
const String ERROR_SIGN_IN_GOOGLE = "A problem occured on sign in, try again";
const String NO_USER_SIGN_IN = "No user exist, try again";
const String ERROR_SIGN_OUT = "A problem occured on sign out, try again";
const String ERROR_SIGN_UP_EMAIL = "A problem occured on sign up, try again";

const String ERROR_CREATE_HABIT =
    "A problem while creating the habit, try again";
const String ERROR_CREATE_SUMMARY =
    "A problem while creating the report, try again";
const String ERROR_GET_HABIT_LIST = "Impossible to get habits, try again";

String firestoreError(int code) {
  switch (code) {
    case 400:
      return "A problem occured while creating the habit, try again";
    case 401:
      return "Impossible to get habit list, try again";
    default:
      return "Unexpected error, try again later, it will be solved soon";
  }
}

String firebaseAuthError(int code) {
  switch (code) {
    case 500:
      return "No user exist with this credentials, try again";
    case 501:
      return "Error while signing out user, try again";
    case 502:
      return "A problem occured while signing up, try again";
    default:
      return "Unexpected error, try again later, it will be solved soon";
  }
}

String localDataError(int code) {
  switch (code) {
    case 600:
      return "A problem occured while removing local user, try again";
    case 601:
      return "A problem occured while saving local user, try again";
    default:
      return "Unexpected error, try again later, it will be solved soon";
  }
}
// TODO: Map exception code number to failure message
