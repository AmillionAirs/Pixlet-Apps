load("render.star", "render")
load("time.star", "time")
load("encoding/base64.star", "base64")

def main(config):

    timezone = config.get("timezone") or "America/Chicago"
    now = time.now().in_location(timezone)
    Minute = now.format("4")
    Hour = now.format("3")

    Top = base64.decode("iVBORw0KGgoAAAANSUhEUgAAAEAAAAAHCAYAAAC4NEsKAAAAAXNSR0IArs4c6QAAAJpJREFUSEvlVEEOgCAM297j/5/Ce2Y4LKlzg4KJB/UiNIPSUqYCn5mZqmrE+hzxXhexPo/rs7oRxvDgeuTLxhWGPDex0YBMWCU2M4/B3HBWkNex/3he5NkyYOVmmURlBvihR6l4xYDsWbCpGCWlem5uWJUG3HPHgMg7TQB72096wEoCMgOqiC/3AGx+fxlfEtBE7AjKm4h8GTsBWd5V62FiJMMAAAAASUVORK5CYII=")
    Bot = base64.decode("iVBORw0KGgoAAAANSUhEUgAAAEAAAAAHCAYAAAC4NEsKAAAAAXNSR0IArs4c6QAAAJpJREFUSEvllFEOgCAMQ7vzeP+jcJ4ZPpbUucHAxA/1R2mGZY+CgJ4G6MECgAbgy5q4fn83vABQVRWRm9apsN7rvNbHfn5UN9IqPjyf/aLvTGOfKYCosazZCF5Fs9hVG7K66tuvl322AKzsbCVREQBb9CgVrwCIjkU1FaOkZMfNgGVp4H/uAPC+0wRUd/vJHbCSgAhAFvHKHXAC8xZV66Y5lSQAAAAASUVORK5CYII=")
    
    if Hour == "1" :
        Hand = 3
    
    elif Hour == "2" :     
        Hand = 7

    elif Hour == "3" :     
        Hand = 13        

    elif Hour == "4" :     
        Hand = 18

    elif Hour == "5" :     
        Hand = 23

    elif Hour == "6" :     
        Hand = 28

    elif Hour == "7" :     
        Hand = 33

    elif Hour == "8" :     
        Hand = 38

    elif Hour == "9" :     
        Hand = 43

    elif Hour == "10" :     
        Hand = 48

    elif Hour == "11" :     
        Hand = 53                                                               

    else:
        Hand = 58

    return render.Root(

       child = render.Column(
           children=[
               render.Image(Top),
               render.Row(
                   children=[
                       render.Box(width=Hand, height=9),
                       render.Box(width=1, height=9, color="#a0a"),
                   ],
               ),
               render.Row(
                   children=[
                       render.Box(width=int(Minute) + 3, height=9),
                       render.Box(width=1, height=9, color="#aa0"),
                   ],
               ),               
               #render.Image(Bot),
           ],
       ), 
       
       
  )