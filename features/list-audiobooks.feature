Feature: Display the list of audiobooks
  In order to know which audiobooks the collection contains
  As an audiobook enthusiast
  I want to see a list of all audiobooks

  Scenario: Display the list of all audiobooks in the collection
    Given some audiobooks in the collection
    When I visit the list of audiobooks
    Then I see all audiobooks

  Scenario: Filter the list
    Given some audiobooks in the collection
    When I visit the list of audiobooks
    And I search for "Cor"
    Then I only see titles matching the search term
    When I remove the filter
    Then I see all audiobooks again

  Scenario: Sort the list
    Given some audiobooks in the collection
    When I visit the list of audiobooks
    And sort by "Author"
    Then I see "Man In The Dark" listed first
    And "Coraline" listed second
    And "Siddhartha" listed third
