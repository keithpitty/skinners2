## Skinners

Skinners helps auditing of my golf club's Saturday Skinners results.

Although the app began life as a Rails app, rake tasks now drive the activities, which currently consist of:

* creating initial data
* loading data for each round
* reporting to check that money was paid out correctly to winning players
* reporting results for each player
* reporting overall yearly summary
* reporting top 10 and top 20 points getters

Skinners makes use of the Prawn Ruby PDF generation library.
