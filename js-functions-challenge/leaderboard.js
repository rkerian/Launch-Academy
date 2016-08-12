var gameInfo = function(){
2	  return [
3	   {
4	     home_team: "Patriots",
5	     away_team: "Broncos",
6	     home_score: 17,
7	     away_score: 13
8	   },
9	   {
10	     home_team: "Broncos",
11	     away_team: "Colts",
12	     home_score: 24,
13	     away_score: 7
14	   },
15	   {
16	     home_team: "Patriots",
17	     away_team: "Colts",
18	     home_score: 21,
19	     away_score: 17
20	   },
21	   {
22	     home_team: "Steelers",
23	     away_team: "Patriots",
24	     home_score: 24,
25	     away_score: 31
26	   }
27	 ]
28	}
29
30	// YOUR CODE HERE
31
32	// Global variable teams (apparently a no-no in JS?)
33	var teams = [];
34
35	function checkIfNameExists(inArr, name) {
36	  for (var i = 0; i < inArr.length; i++) {
37	    if (inArr[i].name == name) {
38	      return true;
39	    };
40	  };
41	  return false;
42	}
43
44	function keysrt(key, desc) {
45	  return function(a,b){
46	    return desc ? ~~(a[key] < b[key]) : ~~ (a[key] < b[key]);
47	  }
48	}
49
50	function createTeams(games, teams) {
51	  for (var i = 0; i < games.length; i++) {
52	    var team_h = games[i].home_team;
53	    var team_a = games[i].away_team;
54
55	    // if home team does not exist in global teams array, create object
56	    if (!checkIfNameExists(teams, team_h)) {
57	      initializeTeam(teams, team_h);
58	    };
59	    // if away team does not exist in global teams array, create object
60	    if (!checkIfNameExists(teams, team_a)) {
61	      initializeTeam(teams, team_a);
62	    };
63	  };
64	}
65
66	function initializeTeam(teams, teamName) {
67	    teams.push({
68	      name: teamName,
69	      wins: 0,
70	      losses: 0,
71	      ranking: undefined,
72	    });
73	}
74
75	function updateStandings(games, teams) {
76
77	  for (var i = 0; i < games.length; i++)
78	  {
79	    var team_h = games[i].home_team;
80	    var team_a = games[i].away_team;
81	    var score_h = games[i].home_score;
82	    var score_a = games[i].away_score;
83
84	    if (score_h > score_a)
85	    {
86	      for (var j = 0; j < teams.length; j++)
87	      {
88	        if (teams[j].name === team_h)
89	        {
90	          teams[j].wins++;
91	        };
92	        if (teams[j].name === team_a)
93	        {
94	          teams[j].losses++;
95	        };
96	      };
97	    }
98	    else if (score_a > score_h)
99	    {
100	      for (var j = 0; j < teams.length; j++)
101	      {
102	        if (teams[j].name === team_h)
103	        {
104	          teams[j].losses++;
105	        };
106	        if (teams[j].name === team_a)
107	        {
108	          teams[j].wins++;
109	        };
110	      };
111	    };
112	  };
113	}
114
115	function rankTeams(teams) {
116	  teams.sort(keysrt('wins'));
117	  for (var i = 0; i < teams.length; i++) {
118	    teams[i].ranking = (i + 1);
119	  }
120	}
121
122	function printLeaderboard(teams) {
123	  rankTeams(teams);
124	  for (var i = 0; i < teams.length; i++) {
125	    console.log("Team: " + teams[i].name + " Total Wins: " + teams[i].wins + " Total Losses: " + teams[i].losses + " Rank: " + teams[i].ranking );
126	  }
127	}
128
129	// MAiN PROGRAM FUNCTIONALITY
130	var games = gameInfo();
131	createTeams(games, teams);
132	updateStandings(games, teams);
133	rankTeams(teams);
134	printLeaderboard(teams);
