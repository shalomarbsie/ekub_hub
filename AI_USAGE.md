# AI usage disclosure

**Ekub Hub · Milestone 1**

## Tools used

### Shalom Arbsie

I built Flutter foundation and navigation in PR #1, demo accounts and shared in-memory Equb data in PR #2, and reviews of PRs #5 and #8. [PR #1](https://github.com/shalomarbsie/ekub-hub/pull/1) · [PR #2](https://github.com/shalomarbsie/ekub-hub/pull/2) · [PR #5](https://github.com/shalomarbsie/ekub-hub/pull/5) · [PR #8](https://github.com/shalomarbsie/ekub-hub/pull/8)

| Tool | Version / model | Used for |
|---|---|---|
| ChatGPT | Sol 6.2 | Explaining Flutter and Riverpod concepts, reviewing a `go_router` setup, and drafting a widget test. |

### Nebiyu Amare

| Tool | Version / model | Used for |
|---|---|---|
| Antigravity (VS Code Agent) | Gemini / Claude agent | Scaffolding Dashboard, Equb Details, Create Equb form, Riverpod providers, repository methods, and widget tests |
| Gemini | Web / Assistant | Git & GitHub branch workflow, PR review checklists, PR descriptions, and troubleshooting errors |

### Yonatan Azmir

| Tool | Version / model | Used for |
|---|---|---|
| Gemini | Gemini 4 | Used as a learning assistant to understand Flutter and Riverpod concepts that were not fully clear, review implementation approaches, and troubleshoot widget test failures. |

### Yanet Geleta

| Tool | Version / model | Used for |
|---|---|---|
| Google Antigravity | Gemini 4 Hydrogen | Explaining Riverpod 3 (`Notifier` / `NotifierProvider.family`) and Freezed 4 syntax, helping draft the contributions and payouts layers and widget tests, debugging test errors, and helping resolve a rebase conflict |

## What was generated and where

| File / function | Member | AI-use level | What the tool produced | What we changed | How we verified it |
|---|---|---|---|---|---|
| `lib/core/routing/app_router.dart` and `lib/core/navigation/app_shell.dart` (PR #1) | Shalom | 2 Review | Feedback on the route tree I had written, including when drawer destinations replace the current route and when detail screens need a back path. | I checked that sign-in and registration stayed outside the drawer shell, kept named drawer destinations, and wired the nested detail and round routes to receive `equbId` and `roundId`. | Run `flutter test test/widget_test.dart` at the PR #1 revision to check that Merchant Equb details open and Back returns to the dashboard. The PR #2 revision also checks Equb and round IDs on the screens reached from details. |
| `lib/features/auth/presentation/providers/session_provider.dart` and `lib/features/equbs/presentation/providers/equb_providers.dart` (PR #2) | Shalom | 1 Explain only | An explanation of `NotifierProvider`, `Provider.family`, and when to use `ref.watch` or `ref.read`. | I wrote the provider code myself. `currentMembershipProvider` watches the session so the lookup updates when the selected demo user changes. I kept demo sign-in and sign-out in `SessionController`. | Run `flutter test test/demo_session_providers_test.dart` to check the member and organizer roles for Merchant Equb, its open round, and the cleared session and membership after sign-out. |
| `test/widget_test.dart` (PR #1, extended in PR #2) | Shalom | 3 Draft and verify | A starter widget test that mounted the app, opened a drawer destination, and checked a detail screen. | I adapted the draft to `EqubHubApp` inside `ProviderScope` and used the project’s screen labels. For PR #2, I changed the flow to sign in as a demo member and added assertions for contribution submission, payout navigation, and sign-out. | Read the test line by line against the screen code, then run `flutter test test/widget_test.dart` and `flutter analyze --fatal-infos`. Check that the test asserts the expected IDs and returns to sign-in after sign-out. |
| `lib/features/equbs/presentation/dashboard_screen.dart`, `equb_details_screen.dart` (PR #3) | Nebiyu Amare | 3 Draft and verify | Initial Dashboard list UI, parameterized route screen, member roster status view, and sample AI summary card | Aligned route parameters and provider watches with PR #1 (`go_router`) and PR #2 shared data models | Ran `flutter analyze --fatal-infos`, ran `dashboard_equb_details_test.dart`, and reviewed line by line |
| `test/dashboard_equb_details_test.dart` (PR #3) | Nebiyu Amare | 3 Draft and verify | Widget test verifying Dashboard rendering and navigating to Equb Details roster and AI summary | Adjusted widget pump/finder expectations to match actual screen widgets and demo data | Ran `flutter test` until all assertions passed |
| `lib/features/equbs/presentation/create_equb_screen.dart` (PR #4) | Nebiyu Amare | 3 Draft and verify | `CreateEqubScreen` form layout, field validators, frequency dropdown, and start date picker | Connected form submission to `equbGroupsProvider.notifier.createEqub(...)` and `go_router` dashboard redirect | Ran `flutter analyze --fatal-infos` and verified form validation and submission via widget test |
| `lib/features/equbs/domain/equb_repository.dart`, `data/in_memory_equb_repository.dart`, `presentation/providers/equb_providers.dart` (PR #4) | Nebiyu Amare | 3 Draft and verify | `createEqub(...)` repository signature, in-memory implementation, and `equbGroupsProvider` `Notifier` | Wired `dashboardEqubsProvider`, `equbProvider`, `membershipsForEqubProvider`, and round providers to reactively watch `equbGroupsProvider` | Verified reactive state updates across Dashboard and Equb Details in `create_equb_test.dart` |
| `test/create_equb_test.dart` (PR #4) | Nebiyu Amare | 3 Draft and verify | Widget test covering validation errors, valid form submission, Dashboard update, and opening Equb Details | Fixed test setup and assertions to match `InMemoryEqubRepository` initial state | Ran `flutter analyze --fatal-infos` and `flutter test` (4/4 suites passing) |
| `lib/features/invitations/domain/qr_scanner_service.dart`, `fake_qr_scanner_service.dart` | Yonatan Azmir | 2 — Review | Helped me understand how to represent camera permission and scanning outcomes using a service abstraction and `QrScanStatus`. | Reviewed the suggestion and kept the enum and `QrScanResult` simple to match the M1 requirements. | Ran `flutter analyze --fatal-infos` and `join_controller_test.dart`. |
| `lib/features/invitations/presentation/join_equb_screen.dart` | Yonatan Azmir | 1 — Explanation | Explained a Riverpod lifecycle issue caused by calling `reset()` synchronously inside `initState`. | Applied the explanation by moving `reset()` into `Future.microtask`, adding a `mounted` check, and correcting a relative import. | Ran `flutter analyze --fatal-infos` and `join_equb_screen_test.dart`. |
| `test/cross_feature_flow_test.dart` | Yonatan Azmir | 2 — Review | Helped me understand why the test could not tap the `Payout & Draw` button within the `800x600` test viewport. | Used `tester.ensureVisible` before tapping and wrote the assertions for the cross-feature flow. | Ran `flutter test`; all 33 tests passed. |
| `lib/features/contributions/domain/contribution_record.dart`, `contribution_repository.dart`, `data/in_memory_contribution_repository.dart` | Yanet Geleta | 3 Draft and verify | Drafted the Freezed models, repository interface, and seeded in-memory data | Removed extra placeholder round/member models once PR #2 merged, aligned demo data with `DemoIds`, fixed `NaN`/`Infinity` amount validation, and cleaned trailing spaces in `.freezed.dart` | Ran `dart run build_runner build`, `git diff --check`, `flutter analyze --fatal-infos`, and unit tests |
| `lib/features/contributions/presentation/contribution_providers.dart` & `contribution_screens.dart` | Yanet Geleta | 3 Draft and verify | Helped set up `ContributionsNotifier`, derived roster providers, and the Submission / Review screens | Removed unneeded comments, fixed back navigation to work without `GoRouter` in isolated tests, wired auth/Equb checks to PR #2 providers, and added finite amount validation in the form and `_formatAmount` | Ran `flutter test` across the full Member -> Organizer -> Member flow and checked UI state updates |
| `lib/features/equbs/presentation/providers/equb_providers.dart` (`equbRosterProvider`) | Yanet Geleta | 3 Draft and verify | Drafted updating `equbRosterProvider` to read from `contributionsForRoundProvider` | Aliased the `contribution_record.dart` import to avoid clashing with `equb_roster_entry.dart`'s `ContributionStatus`, and kept `EqubRepository` untouched so it wouldn't conflict with PR #6 | Ran `dashboard_equb_details_test.dart` and the extended end-to-end test in `contribution_test.dart` |
| `lib/features/payouts/domain/payout_draw.dart`, `payout_repository.dart`, `data/in_memory_payout_repository.dart`, `presentation/payout_providers.dart`, `payout_draw_screen.dart` | Yanet Geleta | 3 Draft and verify | Drafted Freezed models, repository with random winner selection, live readiness provider, and `PayoutDrawScreen` | Extracted a shared `_buildPayoutReadiness` helper to fix a Riverpod `CircularDependencyError`, cleaned trailing spaces in `payout_draw.freezed.dart`, and kept `main`'s `contribution_test.dart` when rebasing | Ran `flutter analyze --fatal-infos` and `flutter test` (`17` passing tests) |
| `test/features/contributions/contribution_test.dart`, `test/features/payouts/payout_test.dart`, `test/widget_test.dart` | Yanet Geleta | 3 Draft and verify | Drafted unit and widget tests for both features and updated placeholder checks in `widget_test.dart` | Added `ensureVisible` scrolling before tapping links on `EqubDetailsScreen` after PR #3 changed the layout, and added regression tests for `NaN`/`Infinity` | Ran `flutter test` against updated `main` |

Freezed generated the `*.freezed.dart` files from the Dart model definitions.

## Which tasks did we do without an assistant first?

### Shalom Arbsie

In this scenario, I sketched the route tree from the proposal before asking for a review. I wanted to be able to trace which screens use the drawer and which IDs a round screen needs. I also chose the demo organizer, member, and prospect accounts and the two Equb scenarios before asking about Riverpod. Merchant has an open round for contribution submission. Family has a completed round for viewing the payout. Choosing those examples first helped me decide what state the screens needed from the repositories.

### Nebiyu Amare

- **Nebiyu Amare:** Defined the PR #3 and PR #4 feature scope and state update rules (creating a group initializes Round 1, organizer membership, and `Pending` contribution status), and manually checked out, ran tests, and reviewed PR #1 (App Foundation) and PR #7 (Payout & Draw) line by line before approving on GitHub.

### Yonatan Azmir

I worked on the following parts independently before using AI for specific questions or debugging:

- Designed and implemented the invitations feature, including the `Invitation` model, `InvitationRepository`, `InMemoryInvitationRepository`, `parseInviteCode`, `JoinController` validation flow, and `JoinEqubScreen`.
- Wrote `invite_payload_parser_test.dart` and `join_controller_test.dart`.
- Reviewed PR #2 and PR #4 independently.
- Prepared the Milestone 1 summary in `MILESTONE.md`.

### Yanet Geleta

- Helped define the Equb Hub user stories, screen flows, and rules in `PROPOSAL.md` and `docs/sketches/key_screens.png` (such as one declaration per member per round, non-custodial payment disclaimers, required rejection reasons, full-approval gating before payout draws, and excluding past cycle winners).
- Coordinated task division and shared demo IDs (`DemoIds`) with the team before coding, reviewed PR #3 (Dashboard & Equb Details) and PR #6 (QR Scanner & Join) on GitHub myself, and ran git commits, rebases, and PR submissions manually.

## Problems found in AI output

### Shalom Arbsie

- **Ambiguous widget finder.** The example test tried to tap `find.text('Dashboard')` after opening the drawer. The dashboard body uses the same text. I scoped the finder to descendants of `Drawer` so it selects the menu item.
- **Stale membership after switching accounts.** The example explanation treated `ref.read` as sufficient inside the membership provider. I used `ref.watch(sessionProvider)` so the provider recalculates when the session changes. The provider test switches from member to organizer and signs out to check those transitions.

### Nebiyu Amare

- **Nebiyu Amare:** Initial AI-generated code for PR #3 and PR #4 used disconnected mock providers instead of reactively updating the shared `InMemoryEqubRepository` and `dashboardEqubsProvider` state from PR #2, and produced minor `flutter analyze --fatal-infos` lint warnings and mismatched widget test finders that had to be corrected manually.

### Yonatan Azmir

I did not use every suggestion without checking it. During implementation, I found and corrected these issues:

- An example import path suggested for `join_equb_screen.dart` contained an extra `../` (`../../../equbs/domain/equb_group.dart`), which caused an error in `flutter analyze`. I corrected it to `../../equbs/domain/equb_group.dart`.
- An initial widget test suggestion tapped `Payout & Draw` without making the button visible in the `800x600` test viewport. I corrected this by adding `tester.ensureVisible`.

These cases helped me understand the code and the errors rather than simply copying suggestions.

### Yanet Geleta

1. **Riverpod `CircularDependencyError` in `runDraw`:** The initial `PayoutDrawsNotifier.runDraw` read `payoutReadinessProvider`, which was already watching `payoutDrawsProvider`. `flutter test` caught the circular dependency, and we fixed it by extracting `_buildPayoutReadiness` and reading the underlying inputs directly.
2. **Widget test crash (`No GoRouter found in context`):** `_ScreenHeader` originally called `context.canPop()`, which threw when testing screens inside a plain `MaterialApp`. Caught by running `flutter test` and fixed with `GoRouter.maybeOf(context)` and a `Navigator.maybeOf(context)` fallback.
3. **Validation missed `NaN` and `Infinity`:** The first `declaredAmount <= 0` check allowed `double.nan` and `double.infinity` (which could also throw in `_formatAmount` on `.toInt()`). Caught during PR #5 review and fixed with `!isFinite || <= 0` in both the form and repository plus regression tests.
4. **Stale `EqubDetails` roster and missed taps after PR #3 merged:** Initially `equbRosterProvider` still read the static map instead of shared round contributions, and PR #3's taller layout pushed `Contribution Review` and `Payout & Draw` off-screen in tests. Fixed by wiring `equbRosterProvider` to `contributionsForRoundProvider` and scrolling buttons into view before tapping.
5. **Generated `.freezed.dart` whitespace and extra diffs:** `build_runner` generated trailing spaces on blank lines in `.freezed.dart` files (flagged by `git diff --check`) and touched PR #2's `.freezed.dart` files; restored unrelated generated files and stripped trailing spaces.

## Individual declaration

| Name | I wrote or reviewed and can explain these files | I entered no passwords, keys or personal data into an AI tool (yes / no) | Signature |
|---|---|---|---|
| Shalom Arbsie | `lib/main.dart`, `lib/core/navigation/app_shell.dart`, `lib/core/routing/app_router.dart`, `lib/features/auth/data/in_memory_account_repository.dart`, `lib/features/auth/presentation/auth_screens.dart`, `lib/features/auth/presentation/providers/session_provider.dart`, `lib/features/equbs/data/in_memory_equb_repository.dart`, `lib/features/equbs/presentation/providers/equb_providers.dart`, `test/demo_session_providers_test.dart`, `test/widget_test.dart` | yes | Shalom Arbsie Gugsa |
| Nebiyu Amare | `lib/features/equbs/presentation/dashboard_screen.dart`, `lib/features/equbs/presentation/equb_details_screen.dart`, `lib/features/equbs/presentation/create_equb_screen.dart`, `lib/features/equbs/domain/equb_repository.dart`, `lib/features/equbs/data/in_memory_equb_repository.dart`, `lib/features/equbs/presentation/providers/equb_providers.dart`, `test/dashboard_equb_details_test.dart`, `test/create_equb_test.dart`, and reviewed PR #1 & PR #7 files | yes | Nebiyu Amare |
| Yonatan Azmir | `lib/features/invitations/domain/invitation.dart`, `lib/features/invitations/domain/invitation_repository.dart`, `lib/features/invitations/domain/invite_payload_parser.dart`, `lib/features/invitations/domain/qr_scanner_service.dart`, `lib/features/invitations/data/fake_qr_scanner_service.dart`, `lib/features/invitations/data/in_memory_invitation_repository.dart`, `lib/features/invitations/presentation/providers/join_providers.dart`, `lib/features/invitations/presentation/join_equb_screen.dart`, `test/invite_payload_parser_test.dart`, `test/join_controller_test.dart`, `test/join_equb_screen_test.dart`, `test/cross_feature_flow_test.dart` | Yes | Yonatan Azmir |
| Yanet Geleta | Authored: `lib/features/contributions/**`, `lib/features/payouts/**`, `equbRosterProvider` in `lib/features/equbs/presentation/providers/equb_providers.dart`, `test/features/contributions/contribution_test.dart`, `test/features/payouts/payout_test.dart`, `test/widget_test.dart`. Reviewed: PR #3 (`lib/features/equbs/**`, `test/dashboard_equb_details_test.dart`) and PR #6 (`lib/features/invitations/**`, `test/invite_payload_parser_test.dart`, `test/join_controller_test.dart`, `test/join_equb_screen_test.dart`). | yes | Yanet Geleta |

Date: 2026-11-27
