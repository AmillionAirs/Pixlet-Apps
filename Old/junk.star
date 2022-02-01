load("render.star", "render")
load("http.star", "http")
load("encoding/json.star", "json")

URL = "https://svc.metrotransit.org/NexTripv2/51408?format=json"


def main():
    MTBL = http.get(URL).json()["stops"][0]["description"]

    return render.Root(
        child = render.Text(MTBL, font="Dina_r400-6")
     )

