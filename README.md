TicTacToe Core
===============
[![Build Status](https://travis-ci.org/bbuchalter/tictactoe_core.png?branch=master)](https://travis-ci.org/bbuchalter/tictactoe_core)
[![Code Climate](https://codeclimate.com/github/bbuchalter/tictactoe_core.png)](https://codeclimate.com/github/bbuchalter/tictactoe_core)
[![Coverage Status](https://coveralls.io/repos/bbuchalter/tictactoe_core/badge.png)](https://coveralls.io/r/bbuchalter/tictactoe_core)

To setup:
```
bundle install
```

To build:
```
rake
```
The build includes full test suite, code coverage analysis, and static code analysis.
The build requires 100% coverage and 0 lint offenses.

To see code coverage via an HTML report:
```
rake coverage
```

To execute a build for every commit in master:
```
rake build_history
```
This may take some time.

To execute  build for origin/master..origin:
```
rake build_since_push
```
