load("render.star","render")
load("time.star", "time")

def main(config):

    timezone = config.get("timezone") or "America/Chicago"
    Today = time.now().in_location(timezone)
    
    First_of_Nov = time.time(year = time.now().year, month = 11, day = 1).in_location("America/Chicago")
    TDAYS = int(((First_of_Nov - Today).hours // 24) + 24)

    return render.Root(
        child = render.Text(str(TDAYS), font="Dina_r400-6")
    
    )