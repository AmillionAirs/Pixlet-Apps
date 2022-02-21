load("render.star", "render")
load("time.star", "time")
load("encoding/base64.star", "base64")

def main(config):

    timezone = config.get("timezone") or "America/Chicago"
    now = time.now().in_location(timezone)
    Minute = now.format("4")
    Hour = now.format("3")
    Month = now.format("Jan")
    Year = now.format("2006")

    Top = base64.decode("iVBORw0KGgoAAAANSUhEUgAAAEAAAAALCAYAAADP9otxAAAAAXNSR0IArs4c6QAAAMpJREFUSEvtVkkSwzAIg/f0/0/Je9zxgQzViKUdckmaWwDbSFhglYd/6vGvtZaqnrb9v/0d247x6ztrLSY6w+wsDs+yHM3O/CynlICdAJLCbNmhGcHmY8R7QitQ3ViW+xgBBgYrMUVAtD+SUxUDyR4hgFUykoCXU3YDEDBWrwJeSeTcf6IHVFfZ+ytgHmgkDRYTEYKx2G/KJtip2DcEYLPs9pSJG8D62Z+AqySQjUE29tiozeIqjf80Bp/4JvqQwCGyXsDCISJ3tr0Bhbst/g1jLG4AAAAASUVORK5CYII=")
    
    if Month == "Jan" :
        MHand = 3
    
    elif Month == "Feb" :     
        MHand = 8

    elif Month == "Mar" :     
        MHand = 13        

    elif Month == "Apr" :     
        MHand = 18

    elif Month == "May" :     
        MHand = 23

    elif Month == "Jun" :     
        MHand = 28

    elif Month == "Jul" :     
        MHand = 33

    elif Month == "Aug" :     
        MHand = 38

    elif Month == "Sep" :     
        MHand = 43

    elif Month == "Oct" :     
        MHand = 48

    elif Month == "Nov" :     
        MHand = 53                                                               

    else:
        MHand = 58

    
    if Hour == "1" :
        Hand = 3
    
    elif Hour == "2" :     
        Hand = 8

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
               render.Stack(
                   children=[
                        render.Row(
                            children=[
                                render.Box(width=MHand, height=11),
                                render.Box(width=1, height=13, color="#0a0"),
                            ],
                        ),
                        render.Row(
                            children=[
                                render.Box(width=int(Minute) + 3, height=9),
                                render.Box(width=1, height=11, color="#aa0"),
                            ],
                        ),
                        render.Row(
                            children=[
                                render.Box(width=Hand, height=9),
                                render.Box(width=1, height=9, color="#a0a"),
                            ],
                        ),
                   ],
               ),
               render.Text("       " + Year),               
           ],
       ), 
  )