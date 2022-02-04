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
                                render.Stack(
                                    children=[
                                        render.Box(width=12, height=10, color="#00a"),
                                        render.Text("MOA", font="CG-pixel-3x5-mono"),
                                    ],
                                ),
                                render.Box(width=6, height=10),
                                render.Text(MTBL[0]["DepartureText"], font="Dina_r400-6"),
                         ],
                    ),
                    render.Box(width=64, height=1, color="#a00"),
                    render.Row(
                         children=[
                             render.Stack(
                                 children=[
                                    render.Box(width=12, height=10, color="#0a0",),
                                    render.Text("STP", font="CG-pixel-3x5-mono"),
                                 ],
                             ),
                              render.Box(width=6, height=10),
                              render.Text(MTGL[0]["DepartureText"], font="Dina_r400-6"),
                         ],
                    ),
                    render.Box(width=64, height=1, color="#a00"),
               ],
          ),            
     )
