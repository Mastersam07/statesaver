# StateSaver
[![codecov](https://codecov.io/gh/Mastersam07/statesaver/graph/badge.svg?token=2bUsmgnSWf)](https://codecov.io/gh/Mastersam07/statesaver)

StateSaver: Flutter's Time Capsule

State restoration is all about saving and restoring an app state quickly after the system destroys activities or applications.

>
> [Saving States Android](https://developer.android.com/topic/libraries/architecture/saving-states)
>
> [Preserving app UI across launches](https://developer.apple.com/documentation/uikit/view_controllers/preserving_your_app_s_ui_across_launches)
>

## 🪄 Roadmap
- [ ] Primitive properties
- [ ] Textfields
- [ ] Navigation
    - [x] Without arguments
    - [x] With arguments
- [ ] Scrollables
- [ ] Root level app widfgets
- [ ] Dialogs
- [ ] Pickers
- [ ] DataTable
- [ ] Drawer/endDrawer
- [ ] Bottomsheet

## Table of RestorableProperty

| Type | Nullable Type | Restorable Type | Restorable Nullable Type |
|------|-------|-------|-------|
| String | String? | RestorableString | RestorableStringN |
| int | int? | RestorableInt | RestorableIntN |
| double | double? | RestorableDouble | RestorableDoubleN |
| num | num? | RestorableNum | RestorableNumN |
| bool | bool? | RestorableBool | RestorableBoolN |
| enum | enum? | RestorableEnum | RestorableEnumN |
| DateTime | DateTime? | RestorableDateTime | RestorableDateTimeN |
| TimeOfDay | TimeOfDay? | RestorableTimeOfDay | RestorableTimeOfDayN |
| Listenable | - | RestorableListenable | - |
| TextEditingController | - | RestorableTextEditingController | - |
| Value<T> | - | RestorableValue<T> | - |

## Enable State Restoration on iOS
To enable state restoration on iOS, a restoration identifier has to be assigned to the FlutterViewController. If the standard embedding (produced by flutter create) is used, this can be accomplished with the following steps:

- In the app's directory, open ios/Runner.xcodeproj with Xcode.
- Select Main.storyboard under Runner/Runner in the Project Navigator on the left.
- Select the Flutter View Controller under Flutter View Controller Scene in the view hierarchy.
- Navigate to the Identity Inspector in the panel on the right.
- Enter a unique restoration ID in the provided field.
- Save the project.

![Enable State Restoration on iOS](/ss/ios_activation.png)

## How to test State Restoration
To test state restoration on Android:

- Turn on "Don't keep activities", which destroys the Android activity as soon as the user leaves it. This option should become available when Developer Options are turned on for the device.
- Run the code sample on an Android device.
- Create some in-memory state in the app on the phone, e.g. by navigating to a different screen.
- Background the Flutter app, then return to it. It will restart and restore its state.

To test state restoration on iOS:

- Open ios/Runner.xcworkspace/ in Xcode.
- (iOS 14+ only): Switch to build in profile or release mode, as launching an app from the home screen is not supported in debug mode.
- Press the Play button in Xcode to build and run the app.
- Create some in-memory state in the app on the phone, e.g. by navigating to a different screen.
- Background the app on the phone, e.g. by going back to the home screen.
- Press the Stop button in Xcode to terminate the app while running in the background.
- Open the app again on the phone (not via Xcode). It will restart and restore its state.

## Some plot twist
- Navigation arguments in state restoration must be serializable. Simply put, primitive data types and Map<Primitive, Primitive> are acceptable. Custom classes should be converted to Map<Primitive, Primitive> before passing.
- Changes applied to your app with hot reload and hot restart are not persisted on the device.
- To test state restoration, always make sure to fully re-compile your application after making a change.