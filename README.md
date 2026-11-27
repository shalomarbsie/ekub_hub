# Ekub Hub

Ekub Hub is an Android app for coordinating an Equb, a traditional rotating
savings group. Members can declare contributions and follow round schedules.
Organizers can create groups, review declarations, and run a demo draw when
the round is ready. The app tracks declarations and draw results without
collecting, holding, or transferring money.

## Run locally

Use Flutter 3.47.0 or later with Dart 3.13.5 or later within Dart 3. Start an
Android emulator or connect an Android phone with USB debugging enabled.
[Flutter Android setup](https://docs.flutter.dev/platform-integration/android/setup)

```sh
git clone https://github.com/shalomarbsie/ekub_hub.git
cd ekub_hub
flutter pub get
flutter devices
flutter run -d YOUR_ANDROID_DEVICE_ID
```

Replace `YOUR_ANDROID_DEVICE_ID` with the Android device ID from `flutter devices`.

## Try the demo

- **Submit and review a contribution.** Choose **Sign in as Member**, open
  **Merchant Equb**, and select **Contribution Submission**. Send a declaration
  for review. Use **Sign out** in the drawer, choose **Sign in as Organizer**,
  and approve the declaration in **Contribution Review**.
- **Check draw readiness.** As the organizer, open **Payout & Draw** in
  Merchant Equb after approval. The open round is then ready for a demo draw.
  **Family Equb** has a completed round with a seeded result.
- **Create or join a group.** Open **Create Equb** from the organizer's drawer.
  To try joining, use **Sign in as Prospect**, open **QR Scanner & Join**, and
  scan the demo QR code or enter `EKUB01`.

Demo data stays in memory when you switch accounts and resets when you restart
the app. QR scans and the rules summary use local demo data.

## Development

Shared navigation and demo IDs live in `lib/core/`. Each feature under
`lib/features/` has domain, data, and presentation layers. The app uses
`go_router` for navigation, Riverpod for state, and Freezed for immutable models.

```sh
flutter analyze --fatal-infos
flutter test
```

[Project proposal](PROPOSAL.md) · [Milestone 1 evidence](MILESTONE.md) ·
[AI usage disclosure](AI_USAGE.md)
