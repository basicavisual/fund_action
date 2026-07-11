Feature: REQ-1 single user invitation

  Background:
    Given a user with role administrator 
    When they visit the path admin/officializations

  Scenario: Invite new user button
    Then a button called "Invite new user" is at the level of the card-title h2 element with the path admin/users/new
      ```erb
        <%#  within decidim-admin/app/views/decidim/admin/officializations/index.html.erb %>
        <div class="card-divider">
          <h2 class="card-title">
            <%= t "decidim.admin.titles.users" %>
            <% if allowed_to? :create, :user %>
              <%= link_to t("actions.user.new", scope: "decidim.admin"), [:new, :user], class: "button tiny button--title" %>
            <% end %>
          </h2>
        </div>
      ```
  
  Scenario: Invite new user form
    Use decidim-core/app/forms/decidim/invite_user_form.rb as context

    Given the user clicks the new "Invite new user" button
    Then they are redirected to a form to invite a new participant with their name and email
    And no role option for normal User (Decidim::ParticipatorySpaceRoleConfig::NullObject.new(user)) is available

  Scenario: Verify email does not belong to existing user

    Use decidim-core/app/commands/decidim/invite_user.rb as context

    Given the Invite new user form is filled out
    And the email does not belong to an existing user of that organization
    Then an email invitation to join the platform will be sent to the inputted email

