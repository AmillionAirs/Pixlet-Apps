load("render.star", "render")
load("http.star", "http")
load("encoding/json.star", "json")
load("encoding/base64.star", "base64")

F1_URL = "http://ergast.com/api/f1/2022/driverStandings"

def main(config):


    #F1_FNAME = http.get(F1_URL).json()["MRData"]["StandingsTable"]["StandingsLists"]["DriverStandings"]["Driver"]
    #F1_LNAME = http.get(F1_URL).json()["MRData"]["StandingsTable"]["StandingsLists"]["DriverStandings"]["Driver"]
    F1_POINTS = http.get(F1_URL).json()["MRData"]["StandingsTable"]["StandingsLists"]["DriverStandings"]

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
                                render.Text(F1_POINTS[0]["points"], font="5x8"),
                            ],
                        ),
                        render.Marquee(
                            width=64,
                            child=render.Text("Alexander Albon"),
                            offset_start=5,
                            offset_end=5,
                        ),
                    ],
                ),
                render.Row(
                    children = [
                        render.Stack(
                            children = [
                                render.Box(width=14, height=7),
                                render.Text("888", font="5x8"),
                            ],
                        ),
                        render.Marquee(
                            width=64,
                            child=render.Text("Alexander Albon"),
                            offset_start=5,
                            offset_end=5,
                        ),
                    ],
                ),
                 render.Row(
                    children = [
                        render.Stack(
                            children = [
                                render.Box(width=14, height=7),
                                render.Text("888", font="5x8"),
                            ],
                        ),
                        render.Marquee(
                            width=64,
                            child=render.Text("Alexander Albon"),
                            offset_start=5,
                            offset_end=5,
                        ),
                    ],
                ),
            ],
        ),
    )