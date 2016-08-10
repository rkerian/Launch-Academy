The NFL has tasked you with building a program that tracks game results as the season progresses. In this assignment, you will build a Ruby application that prints a leaderboard when your code runs. (For the non-sports fans, a leaderboard is a scoreboard that shows the team name, rank, number of wins, and number of losses.)

First, in your root directory run `rspec spec` and pass the unit tests in the spec directory file for a `Team` class. This will help you write the constructor (or initialize) method. This method is what constructs an instance of a Team object. Be sure to have the following attributes:
- Name
- Rank (based on wins)
- Wins (total number of wins)
- Losses (total number of losses)

Then, let's think about what a Leaderboard object should contain. It should be initialized based on game data and should hold and display any number of teams objects, so that is can display each teams' stats.

Create a Leaderboard class that is initialized by game data and has an attribute of an array of teams. When calling the "display" method on a leaderboard object it should print to the terminal.

Note, the game data is supplied in the `leaderboard.rb` file as a constant, `GAME_INFO`. Constants act like variables. When defined within a class a constant may be accessed anywhere within that class. Constants may not be defined within methods.

####Tips:
Focus on organizing your code well. Break out individual steps or tasks into methods. Write unit tests and methods that accomplish the following:

- Creates team object by iterating through `GAME_INFO` to create team objects with only their names.
- Iterates through `GAME_INFO` again to set the number of wins and losses for each team.
- Sorts your team by wins and set their ranks.
- Displays the leaderboard in the terminal.

Format your output such to look (at least approxomitely) like this:

```
--------------------------------------------------
| Name      Rank      Total Wins    Total Losses |
| Patriots  1         3             0            |
| Steelers  2         1             1            |
| Broncos   3         1             2            |
| Colts     4         0             2            |
--------------------------------------------------
```

###Extra Credit Option: Retrieving More Data

Write a Leaderboard instance method called `#team_game_summary` that takes a parameter of a team object and prints the following details of each game that team played, example format below.

```
Patriots played 3 games.
They played as the home team against the Broncos and won: 17 to 13.
They played as the home team against the Colts and won: 21 to 17.
They played as the away team against the Steelers and won: 31 to 24.
```
