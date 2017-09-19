road(
    country,
    lanes(2),
    parking(0),
    hourly_capacity(800,1200),
    daily(8000)
).
road(
    city_arterial,
    lanes(6),
    parking(2),
    hourly_capacity(700,1000),
    daily(12000)
).
road(
    neighborhood,
    lanes(3),
    parking(2),
    hourly_capacity(500,500),
    daily(1500)
).

usage(RoadType, ActiveTransport, Storage, NoUse) :-
    road(RoadType, lanes(Lanes), parking(Parking), hourly_capacity(HourlyMin,HourlyMax), daily(DailyTotal)),
    AvgHourly is ((HourlyMax + HourlyMin) / 2) * Lanes,
    ActiveTransport is (DailyTotal / (AvgHourly * 24)) * 100,
    Storage is Parking, % not right, but on avg, how many cars park per unit of road?
    NoUse is 100 - ActiveTransport.

