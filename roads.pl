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

parking_percent(neighborhood, (95/100)). % residential areas, the parking is always nearly full.
parking_percent(city_arterial, (10/24)). % work hours, say 10 of 24
parking_percent(country, 0).

usage(RoadType, ActiveTransport, Storage, NoUse) :-
    road(RoadType, lanes(TotalLanes), parking(Parking), hourly_capacity(HourlyMin,HourlyMax), daily(DailyTotal)),
    DrivingLanes is TotalLanes - Parking, % Total lanes - parking lanes = driving lanes
    AvgHourly is ((HourlyMax + HourlyMin) / 2) * DrivingLanes, % Avg people that _could_ pass through
    ActiveTransport is (DailyTotal / (AvgHourly * 24)) * 100, % Percentage of people, compared to what could go through
    parking_percent(RoadType, ParkingFactor), % ratio of used parking to total parking for given road type
    Storage is (ParkingFactor * (Parking / TotalLanes) * 100), % parking percentage of total
    NoUse is 100 - (ActiveTransport + Storage). % Anything left (no use).
