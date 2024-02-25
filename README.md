# StateSaver

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
    - [ ] Without arguments
    - [ ] With arguments
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
