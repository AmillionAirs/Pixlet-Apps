load("render.star", "render")
load("time.star", "time")
load("encoding/base64.star", "base64")

def main(config):

    timezone = config.get("timezone") or "America/Chicago"
    now = time.now().in_location(timezone)
    Minute = now.format("4")
    Hour = now.format("3")

    Top = base64.decode("iVBORw0KGgoAAAANSUhEUgAAAEAAAAALCAYAAADP9otxAAAAAXNSR0IArs4c6QAAAMpJREFUSEvtVkkSwzAIg/f0/0/Je9zxgQzViKUdckmaWwDbSFhglYd/6vGvtZaqnrb9v/0d247x6ztrLSY6w+wsDs+yHM3O/CynlICdAJLCbNmhGcHmY8R7QitQ3ViW+xgBBgYrMUVAtD+SUxUDyR4hgFUykoCXU3YDEDBWrwJeSeTcf6IHVFfZ+ytgHmgkDRYTEYKx2G/KJtip2DcEYLPs9pSJG8D62Z+AqySQjUE29tiozeIqjf80Bp/4JvqQwCGyXsDCISJ3tr0Bhbst/g1jLG4AAAAASUVORK5CYII=")
    
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
               render.Stack(
                   children=[
                        render.Row(
                            children=[
                                render.Box(width=Hand, height=9),
                                render.Box(width=1, height=7, color="#a0a"),
                            ],
                        ),
                        render.Row(
                            children=[
                                render.Box(width=int(Minute) + 3, height=9),
                                render.Box(width=1, height=9, color="#aa0"),
                            ],
                        ),
                   ],
               ),               
           ],
       ), 
  )