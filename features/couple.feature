Feature: DINK Reckoner
  In order to receive DINK reckoner
  As a client with valid request
  I want to POST to the Couple API

Scenario: Valid couple and user details
  Given a couple
  And users information
  When I post the couple payload
  Then the response is successful
