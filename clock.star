load("render.star", "render")
load("time.star", "time")

def main(config):
    timezone = config.get("timezone") or "America/New_York"
    now = time.now().in_location(timezone)
    now_date = now.format('2 JAN 2006')
    Day = now.format('Monday')

    return render.Root(
       child = render.Column(
          expanded=True,
          cross_align="center",
          main_align="space_around",
               children=[
               render.Box(width=64, height=1),    
               render.Text(
                    content = now.format("3:04 PM"),
                    font = "6x13",
                    ),
               render.Text(
                    content = Day,
                    ),
               render.Text(
                    content = now_date,
                    font = "5x8",
                    ),
               ],
          )
  )
