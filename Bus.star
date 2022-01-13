load("render.star", "render")
load("http.star", "http")
load("encoding/json.star", "json")

URL = "https://svc.metrotransit.org/NexTrip/Directions/5?format=json"

def main():
    MT = http.get(URL).json()

    return render.Root(
        child = render.Text(MT)
    )