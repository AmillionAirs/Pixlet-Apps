load("render.star", "render")
load("http.star", "http")
load("encoding/json.star", "json")

URL = "https://svc.metrotransit.org/NexTrip//901/1/5SNI?format=json"
URL2 = "https://svc.metrotransit.org/NexTrip//902/0/5SNI?format=json"

def main():
    MTBL = http.get(URL).json()
    MTGL = http.get(URL2).json()

    return render.Root(
        child = render.Column(
                children = [
                    render.Text("NICOLLET MALL"),
                    render.Box(width=64, height=1),
                    render.Box(width=64, height=1, color="#a00"),
                    render.Row(     
                         children=[
                              render.Box(width=10, height=10, color="#00a"),
                              render.Box(width=4, height=10),
                              render.Text(MTBL[0]["DepartureText"], font="Dina_r400-6"),
                         ],
                    ),
                    render.Box(width=64, height=1, color="#a00"),
                    render.Row(
                         children=[
                              render.Box(width=10, height=10, color="#0a0",),
                              render.Box(width=4, height=10),
                              render.Text(MTGL[0]["DepartureText"], font="Dina_r400-6"),
                         ],
                    ),
                    render.Box(width=64, height=1, color="#a00"),
               ],
          ),            
     )
