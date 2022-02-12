load("render.star", "render")
load("http.star", "http")
load("encoding/json.star", "json")
load("encoding/base64.star", "base64")

#F1_URL = "http://ergast.com/api/f1/2022/driverStandings"

def main(config):


    #F1_NAME = http.get(F1_URL).json()["MRData"]["RaceTable"]["Races"][0]["raceName"]
    #F1_Team = http.get(F1_URL).json()["MRData"]["RaceTable"]["Races"][0]["date"]

    return render.Root(
        child = render.Column(
            children = [
                render.Text("WCC Standings 2022"),
                render.Box(width=64, height=1, color="#a0a"),
                render.Text("Alexander Albon"),
                render.Text("Alexander Albon"),
                render.Text("Alexander Albon"),
            ],
        ),
    )