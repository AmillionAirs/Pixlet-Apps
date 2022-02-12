load("render.star", "render")
load("http.star", "http")
load("encoding/json.star", "json")

F1_URL = "http://ergast.com/api/f1/2022/next.json"

def main(config):

    F1_NAME = http.get(F1_URL).json()["MRData"]["RaceTable"]["Races"][0]["raceName"]
    F1_DATE = http.get(F1_URL).json()["MRData"]["RaceTable"]["Races"][0]["date"]

    return render.Root(
        child = render.Text(F1_DATE)
    )