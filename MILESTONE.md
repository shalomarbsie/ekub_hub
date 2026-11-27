# Milestone 1 — Screens, Navigation, and State (`m1`)

## What Is Done
- **Feature-first structure**: Organized `lib/core/` (`demo`, `navigation`, `routing`) and `lib/features/` (`auth`, `equbs`, `contributions`, `payouts`, `invitations`) with `domain/`, `data/`, and `presentation/` layers.
- **All proposed screens & navigation**: Every screen from `PROPOSAL.md` (`SignInScreen`, `RegisterScreen`, `DashboardScreen`, `EqubDetailsScreen`, `CreateEqubScreen`, `ContributionSubmissionScreen`, `ContributionReviewScreen`, `JoinEqubScreen`, `PayoutDrawScreen`) is implemented and reachable via `go_router` (`AppShell` drawer + parameterized detail and round routes).
- **State & immutable models**: Application state is managed in Riverpod providers (`NotifierProvider`, `Provider`, `Provider.family`) backed by `freezed` domain models and in-memory repositories behind abstract interfaces (`AccountRepository`, `EqubRepository`, `ContributionRepository`, `PayoutRepository`, `InvitationRepository`, `QrScannerService`).
- **Tests & static analysis**: 33 unit and widget tests (including cross-feature flows) pass with `flutter analyze --fatal-infos` clean.

## What Is Not Done Yet (Planned for Milestone 2 & Final)
- Local persistence (`drift` SQLite cache + `shared_preferences`).
- Remote data sources: Shelf REST backend (`readiness`, `draw`, `export-summary`) and Firebase (Auth + Cloud Firestore).
- Real device camera QR scanning (`mobile_scanner` + permission handling) and live Gemini API AI summary behind a backend proxy.
- CI workflow (GitHub Actions), build flavours (`development` / `production`), `PRIVACY.md`, and `USER_TEST.md`.

## Who Did What

| Member | Authored PRs | Reviewed PRs |
|---|---|---|
| **Shalom Arbsie** (`shalomarbsie`) | [PR #1](https://github.com/shalomarbsie/ekub-hub/pull/1) (App foundation, feature folders, `go_router`, Riverpod, Freezed), [PR #2](https://github.com/shalomarbsie/ekub-hub/pull/2) (Demo accounts & shared in-memory Equb data) | [PR #5](https://github.com/shalomarbsie/ekub-hub/pull/5) (Contribution submission & review), [PR #8](https://github.com/shalomarbsie/ekub-hub/pull/8) (Cross-feature test & M1 docs) |
| **Nebiyu Amare** (`nebiyua`) | [PR #3](https://github.com/shalomarbsie/ekub-hub/pull/3) (Dashboard & Equb Details with roster and sample AI summary), [PR #4](https://github.com/shalomarbsie/ekub-hub/pull/4) (Create Equb form & dashboard update) | [PR #1](https://github.com/shalomarbsie/ekub-hub/pull/1) (App foundation), [PR #7](https://github.com/shalomarbsie/ekub-hub/pull/7) (Payout readiness & draw) |
| **Yonatan Azmir** (`Ezmir12`) | [PR #6](https://github.com/shalomarbsie/ekub-hub/pull/6) (QR Scanner & Join with fake scan, Equb preview, and manual invite code), [PR #8](https://github.com/shalomarbsie/ekub-hub/pull/8) (Cross-feature widget test & M1 docs) | [PR #2](https://github.com/shalomarbsie/ekub-hub/pull/2) (Demo accounts & shared data), [PR #4](https://github.com/shalomarbsie/ekub-hub/pull/4) (Create Equb form) |
| **Yanet Geleta** (`yanetgeleta`) | [PR #5](https://github.com/shalomarbsie/ekub-hub/pull/5) (Contribution submission & organizer review), [PR #7](https://github.com/shalomarbsie/ekub-hub/pull/7) (Payout readiness, draw & winner history) | [PR #3](https://github.com/shalomarbsie/ekub-hub/pull/3) (Dashboard & Equb Details), [PR #6](https://github.com/shalomarbsie/ekub-hub/pull/6) (QR Scanner & Join) |

## Group Self-Score (Milestone 1 Mini-Rubric)

| Criterion | Max | Self-Score | Evidence |
|---|---:|---:|---|
| All proposed screens present and navigable | 3 | 3 | The eight screen entries in `PROPOSAL.md` are reachable through `go_router`, with separate Sign In and Register routes and widget tests covering drawer, Equb detail, and round navigation. |
| Feature-first structure; state in providers, not widgets | 2 | 2 | Code is organized under `lib/core` and `lib/features/<feature>/{domain,data,presentation}` with `freezed` models, repository interfaces, and Riverpod controllers/providers. |
| Tests present; analyser and tests clean in the pasted output | 1 | 1 | 33 unit and widget tests pass and `flutter analyze --fatal-infos` reports zero issues (pasted below). |
| Repository hygiene: branches, pull requests, readable history | 1 | 1 | Every feature was developed on a `feat/m1-*` branch, reviewed by another member, and merged to `main` with merge commits preserving commit history. |
| Individual oral check (recorded per member) | 3 | — | Pending (graded individually by the TA in the lab after the deadline). |
| **Total (excluding oral check)** | **7** | **7** | |

## One Thing We Will Change Before Milestone 2
We will agree on shared repository method signatures (such as `EqubRepository` methods) before starting parallel feature branches so teammates do not run into merge conflicts in shared domain/data files.

## Verification Output (`flutter analyze --fatal-infos` and `flutter test`)

```text
$ flutter analyze --fatal-infos
Analyzing ekub-hub...
No issues found! (ran in 5.3s)

$ flutter test
00:00 +0: loading C:/Projects/ekub-hub/test/create_equb_test.dart
00:00 +0: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:00 +1: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:01 +2: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:01 +3: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:01 +4: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:01 +5: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:01 +6: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:01 +7: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:01 +8: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:01 +9: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:02 +10: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:02 +11: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:02 +12: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:03 +13: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:04 +14: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:04 +15: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:04 +16: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:04 +17: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:04 +18: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:04 +19: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:04 +20: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:04 +21: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:04 +22: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:04 +23: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:04 +24: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:04 +25: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:05 +26: C:/Projects/ekub-hub/test/create_equb_test.dart: Create Equb form validates input, updates Dashboard, and opens Equb Details
00:05 +27: C:/Projects/ekub-hub/test/cross_feature_flow_test.dart: Cross-feature flow: Prospect joins via QR, Organizer creates Equb and checks Payout & Draw
00:06 +28: C:/Projects/ekub-hub/test/features/payouts/payout_test.dart: PayoutDrawScreen widget tests updates live from Waiting -> Ready -> Winner across Contributions and Payouts
00:07 +29: C:/Projects/ekub-hub/test/features/contributions/contribution_test.dart: Contribution screens widget tests runs full member submit -> sign out -> organizer review -> updated roster and member status
00:08 +30: C:/Projects/ekub-hub/test/join_equb_screen_test.dart: scans, previews Equb, requests to join, and validates errors
00:08 +31: C:/Projects/ekub-hub/test/widget_test.dart: Opens Merchant Equb details and returns to Dashboard
00:09 +32: C:/Projects/ekub-hub/test/widget_test.dart: Opens Merchant Equb details and returns to Dashboard
00:10 +33: All tests passed!
```
