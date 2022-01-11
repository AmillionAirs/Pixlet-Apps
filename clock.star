load("render.star", "render")
load("time.star", "time")

def main(config):
    timezone = config.get("timezone") or "America/New_York"
    now = time.now().in_location(timezone)
    now_date = now.format('2 Jan 2006')

    return render.Root(
       child = render.Column(
          expanded=True,
          cross_align="center",
               children=[
               render.Text(
                    content = now.format("3:04 PM"),
                    font = "6x13",
                    ),
               render.Box(width=70, height=5, color="#0a0"),
               render.Text(
                    content = now_date,
                    font = "6x13",
                    ),
               ],
          )
  )