load("render.star", "render")
load("http.star", "http")
load("encoding/json.star", "json")

URL = "https://svc.metrotransit.org/NexTripv2/51408?format=json"


def main():
    MT_Station_Name = http.get(URL).json()["stops"][0]["description"]
    MT_Departure_Text = http.get(URL).json()["departures"][0]["departure_text"]
    MT_Route_Destination = http.get(URL).json()["departures"][0]["description"]
    MT_Route_Color = http.get(URL).json()["departures"][0]["route_short_name"]

    return render.Root(
        child = render.Text(MT_Route_Color, font="Dina_r400-6")
     )

