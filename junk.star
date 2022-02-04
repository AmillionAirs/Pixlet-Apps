load("render.star","render")
load("time.star", "time")

def main(config):

    timezone = config.get("timezone") or "America/Chicago"
    now = time.now().in_location(timezone)
    Minute = now.format("4")
    Hour = now.format("3")

    return render.Root(
        child = render.Text(str(int(Minute) + 3), font="Dina_r400-6")
    
    )