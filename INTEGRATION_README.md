# Nourish for Two — integration candidate

**Foundation:** Wyatt's `feature/login-profile-navigation` ZIP (November 6, 2026), preserving original Xcode project, assets, splash screen, registration/login layout, theme, and profile appearance.

**Integrated:** Youssef's Study Reminders and Education/Tips (list + details, hardcoded data), wired into Wyatt's tab bar. Added mock Community messaging and Engage trivia/survey preview to replace blank tabs.

**Functional corrections:** mock login email/password validation; registration name/email/password match validation; forgot-password preview avoids falsely saying a real email was sent; profile navigation actions and logout; no dead social sign-in buttons.

**Mock-only:** No real authentication, notifications, persistent messages, study scheduling, survey storage, or password recovery. Avoid entering genuine credentials, real patient data or study participant data.

## Required review and test before merge

- [ ] Open `NT4Plus-iOS.xcodeproj` in Xcode on a Mac and run simulator build. This environment has no Apple iOS SDK and cannot certify compilation.
- [ ] Confirm splash → welcome → invalid/valid login → all five tabs → profile logout → welcome.
- [ ] Confirm registration invalid/valid states and password mismatches.
- [ ] Confirm forgot-password invalid/valid emails; no actual email must be claimed/sent.
- [ ] Confirm every reminder/detail and educational article/detail opens and back navigation works.
- [ ] Confirm local community message and trivia/survey mock flow.
- [ ] Check app layout, accessibility, dark/light themes, and latest shared Figma design.
- [ ] Review with Wyatt and Youssef. Push to the required integration branch and open a PR to Ved; do **not** merge directly.

This ZIP is a local integration candidate; it has **not** been pushed to the private team repository.
