Feature: Add an audiobook to the collection
  In order to have the collection up to date when I buy new audiobooks
  As an audiobook enthusiast
  I want to add new audiobooks

  Scenario: Add a new audiobook to the collection via menu
    When I visit the list of audiobooks
    And select "Add new Audiobook" from the menu
    Then I see the form for adding a new audiobook
    When I hack in a new audiobook
    And save it
    Then I see the new audiobook in the list of audiobooks

  Scenario: Add a new audiobook to the collection via button on list page
    When I visit the list of audiobooks
    And click the button to add a new audiobook
    Then I see the form for adding a new audiobook
    When I hack in a new audiobook
    And save it
    Then I see the new audiobook in the list of audiobooks
