load("render.star", "render")
load("http.star", "http")
load("encoding/json.star", "json")

URL = "https://svc.metrotransit.org/NexTrip//902/1/5SNI?format=json"
URL2 = "https://svc.metrotransit.org/NexTrip//902/0/5SNI?format=json"

def main():  

     MTT = http.get(URL).json()
     MTT2 = http.get(URL2).json()

     if MTT[0]["Route"] == "Blue":
          CB = "#00a"

          if MTT[0]["Description"] == "to Mpls-Target Field":
               DB = "MTF"
          else:      
               DB = "MOA"     

     else:
          CB = "#0a0"

          if MTT[0]["Description"] == "to Mpls-Target Field":
               DB = "MTF"
          else:      
               DB = "STP"



     if MTT2[0]["Route"] == "Blue":
          CB2 = "#00a"

          if MTT2[0]["Description"] == "to Mpls-Target Field":
               DB2 = "MTF"
          else:      
               DB2 = "MOA"     

     else:
          CB2 = "#0a0"

          if MTT2[0]["Description"] == "to Mpls-Target Field":
               DB2 = "MTF"
          else:      
               DB2 = "STP"



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
                                        render.Box(width=12, height=10, color=CB),
                                        render.Text(DB, font="CG-pixel-3x5-mono"),
                                    ],
                                ),
                                render.Box(width=6, height=10),
                                render.Text(MTT[0]["DepartureText"], font="Dina_r400-6"),
                         ],
                    ),
                    render.Box(width=64, height=1, color="#a00"),
                    render.Row(
                         children=[
                             render.Stack(
                                 children=[
                                    render.Box(width=12, height=10, color=CB2),
                                    render.Text(DB2, font="CG-pixel-3x5-mono"),
                                 ],
                             ),
                              render.Box(width=6, height=10),
                              render.Text(MTT2[0]["DepartureText"], font="Dina_r400-6"),
                         ],
                    ),
                    render.Box(width=64, height=1, color="#a00"),
               ],
          ),            
     )
