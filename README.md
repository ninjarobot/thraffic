Thraffic
========

Finding traffic solutions for @adron's Thrashing Code.

A few assumptions had to be made since we don't know how utilized the parking is.  Here are some percentages if we make some assumptions about parking usage:

```prolog
parking_percent(neighborhood, (95/100)). % residential areas, the parking is always nearly full.
parking_percent(city_arterial, (10/24)). % work hours, say 10 of 24
parking_percent(country, 0).
```

* A country road is 83% unused.
* The city artery is 71% unused, since it's not near it's capacity.
* The neighborhood road is 24% unused, given it's mostly used for parking and tougher to get through.

```
?- usage(RoadType, Active, Storage, NoUse).
RoadType = country,
Active = 16.666666666666664,
Storage = 0,
NoUse = 83.33333333333334 ;
RoadType = city_arterial,
Active = 14.705882352941178,
Storage = 13.88888888888889,
NoUse = 71.40522875816993 ;
RoadType = neighborhood,
Active = 12.5,
Storage = 63.33333333333333,
NoUse = 24.16666666666667.
```

### Running the code

#### Install SWI-Prolog [downloads](http://www.swi-prolog.org/Download.html)

Start SWI-Prolog and load the facts and predicates
```
swipl roads.pl
```

Evaluate the goal at the `?-` prompt:
```
?- usage(RoadType, Active, Storage, NoUse).
```
Press semicolon `;` to continue through the responses.  When you're done, you can exit `swipl` with `halt.` or `Ctrl+D`.

#### Use the official docker image

```
docker run --rm -it -v `pwd`:/app -w /app swipl
```
Load (consult) the facts and predicates:

```
?- [roads]
true.
```

Then evaluate the goal:

```
?- usage(RoadType, Active, Storage, NoUse).
RoadType = country,
Active = 16.666666666666664,
Storage = 0,
NoUse = 83.33333333333334 ;
RoadType = city_arterial,
Active = 14.705882352941178,
Storage = 13.88888888888889,
NoUse = 71.40522875816993 ;
RoadType = neighborhood,
Active = 12.5,
Storage = 63.33333333333333,
NoUse = 24.16666666666667.
```

### HOW DO I EXIT ~~VIM~~ SWIPL?
The `halt` predicate will exit and get your back to your shell.
```
?- halt.
```
