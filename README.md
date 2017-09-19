Thraffic
========

Finding traffic solutions for @adron's Thrashing Code.

Here are some percentages, although we can't really calculate storage just yet:

```
?- usage(RoadType, Active, Storage, NoUse).
RoadType = country,
Active = 16.666666666666664,
Storage = 0,
NoUse = 83.33333333333334 ;
RoadType = city_arterial,
Active = 9.803921568627452,
Storage = 2,
NoUse = 90.19607843137254 ;
RoadType = neighborhood,
Active = 4.166666666666666,
Storage = 2,
NoUse = 95.83333333333333.
```

To really determine how much the road is used for storage as well, 
we need to know, on average, how many cars are parked on some length
of road.