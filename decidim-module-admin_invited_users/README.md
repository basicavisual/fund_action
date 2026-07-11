# Decidim Admin-invited Users

Context:
On the system panel, there's a functionality called "Users registrations mode". An option is Do not allow participants to register, but allow existing participants to login. However, Decidim doesn't have a functionality to trigger a email invitations for new user accounts from the admin panel. This module will allow the following requirements:


| requirement | description | definition | implementation status |
| --- | --- | --- | --- |
| req-1: Single user registration. | The admin has the ability to invite one user by inputting their email. | decidim-module-admin_invited_users/features/single-user-invitation.feature for definition | In progress |
 | req-2: pending invitations | The admin has the ability to resend pending in invitations | decidim-module-admin_invited_users/features/pending-invitations.features | In progress |

## Installation

Add to your `Gemfile`:

```ruby
gem "decidim-admin_invited_users", path: "decidim-module-admin_invited_users"
```

Then run:

```bash
bundle install
```

## Usage

1. Navigate to `/admin/officializations` as an admin user
2. Click "Invite new user" button to invite a new participant
3. For users with pending invitations, use the resend icon in the actions column