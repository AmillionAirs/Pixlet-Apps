load("render.star", "render")
load("http.star", "http")
load("encoding/json.star", "json")
load("time.star", "time")
load("encoding/base64.star", "base64")
load("cache.star", "cache")

def main(config):

    timezone = config.get("timezone") or "America/Chicago"
    now = time.now().in_location(timezone)
    Year = now.format("2006")

    #Cache Data
    f1_cached = cache.get("f1_rate")

    if f1_cached != None:
        print("Hit! Displaying cached data.")
        f1_data = json.decode(f1_cached)
    else:
        print("Miss! Calling F1 Track data.")

        F1_BASE_URL = "http://ergast.com/api/f1/" + Year + "/driverStandings.json"
        F1_URL = http.get(F1_BASE_URL)

        F1_FNAME = F1_URL.json()["MRData"]["StandingsTable"]["StandingsLists"][0]["DriverStandings"][0]["Driver"]["givenName"]
        F1_LNAME = F1_URL.json()["MRData"]["StandingsTable"]["StandingsLists"][0]["DriverStandings"][0]["Driver"]["familyName"]
        F1_POINTS = F1_URL.json()["MRData"]["StandingsTable"]["StandingsLists"][0]["DriverStandings"][0]["points"]

        F1_FNAME2 = F1_URL.json()["MRData"]["StandingsTable"]["StandingsLists"][0]["DriverStandings"][1]["Driver"]["givenName"]
        F1_LNAME2 = F1_URL.json()["MRData"]["StandingsTable"]["StandingsLists"][0]["DriverStandings"][1]["Driver"]["familyName"]
        F1_POINTS2 = F1_URL.json()["MRData"]["StandingsTable"]["StandingsLists"][0]["DriverStandings"][1]["points"]

        F1_FNAME3 = F1_URL.json()["MRData"]["StandingsTable"]["StandingsLists"][0]["DriverStandings"][2]["Driver"]["givenName"]
        F1_LNAME3 = F1_URL.json()["MRData"]["StandingsTable"]["StandingsLists"][0]["DriverStandings"][2]["Driver"]["familyName"]
        F1_POINTS3 = F1_URL.json()["MRData"]["StandingsTable"]["StandingsLists"][0]["DriverStandings"][2]["points"]


        f1_data = dict(F1_FNAME = F1_FNAME, F1_LNAME = F1_LNAME, F1_POINTS = F1_POINTS, F1_FNAME2 = F1_FNAME2, F1_LNAME2 = F1_LNAME2, F1_POINTS2 = F1_POINTS2, F1_FNAME3 = F1_FNAME3, F1_LNAME3 = F1_LNAME3, F1_POINTS3 = F1_POINTS3)
        cache.set("f1_rate", json.encode(f1_data), ttl_seconds = 1600) 

    return render.Root(
        child = render.Column(
            children = [
                render.Text("WDC Standings"),
                render.Box(width=64, height=1, color="#a0a"),
                render.Row(
                    children = [
                        render.Stack(
                            children = [
                                render.Box(width=14, height=7),
                                render.Text(f1_data["F1_POINTS"], font="5x8"),
                            ],
                        ),
                        render.Marquee(
                            width=50,
                            child=render.Text(f1_data["F1_FNAME"] + " " + f1_data["F1_LNAME"]),
                            offset_start=1,
                            offset_end=1,
                        ),
                    ],
                ),
                render.Row(
                    children = [
                        render.Stack(
                            children = [
                                render.Box(width=14, height=7),
                                render.Text(f1_data["F1_POINTS2"], font="5x8"),
                            ],
                        ),
                        render.Marquee(
                            width=50,
                            child=render.Text(f1_data["F1_FNAME2"] + " " + f1_data["F1_LNAME2"]),
                            offset_start=1,
                            offset_end=1,
                        ),
                    ],
                ),
                 render.Row(
                    children = [
                        render.Stack(
                            children = [
                                render.Box(width=14, height=7),
                                render.Text(f1_data["F1_POINTS3"], font="5x8"),
                            ],
                        ),
                        render.Marquee(
                            width=50,
                            child=render.Text(f1_data["F1_FNAME3"] + " " + f1_data["F1_LNAME3"]),
                            offset_start=1,
                            offset_end=1,
                        ),
                    ],
                ),
            ],
        ),
    )