# Release 3.0

The main objectives of this release are as follows:
- Updating to version 0.26
- Ensuring admins are able to invite new people

## Additions

- New module to invite users at decidim-module-admin_invited_users/ it allows an admin to invite a user and resend invitations
- Script to automate migration process at scripts/migration_026.sh

## Changes:
- ForceAuthenticationPatch needed cleanup. Now renamed to HomepageVisibilityPatch. It avoids overriding existing code. Inserts at the application controller level rather than at the concern level.
- Restored values to config/environments/development.rb to ensure mailer is ready for development debugging
- Upgraded to version 0.26.9 (latest)

## Removals:
- Remove user invitations functionality. 
- Cleanup login screen override
- Remove replacement of share modal