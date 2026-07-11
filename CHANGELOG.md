# Release 3.0

The main objectives of this release are as follows:
- Updating to version 0.26
- Ensuring admins are able to invite new people

## Changes:
- ForceAuthenticationPatch needed cleanup. Now renamed to HomepageVisibilityPatch. It avoids overriding existing code. Inserts at the application controller level rather than at the concern level.

## Removals:
- Remove user invitations functionality. 
- Cleanup login screen override
- Remove replacement of share modal