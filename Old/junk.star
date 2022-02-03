load("render.star","render")
load("time.star", "time")

def main(config):


    timezone = config.get("timezone") or "America/Chicago"
    now = time.now().in_location(timezone)
    #Today = now.format('Mon')

    First_of_Nov = time.time(year = time.now().year, month = 11, day = 2).in_location("America/Chicago")
    Xmas = time.time(year = time.now().year, month = 11, day = 24).in_location("America/Chicago")
    HWEEN = time.time(year = time.now().year, month = 10, day = 31).in_location("America/Chicago")
    TDAYS = int(((First_of_Nov - Today).hours // 24) + 25)

    TEST = time.time(year = time.now().year, month = 11, day = TDAYS).in_location("America/Chicago")

    return render.Root(
        child = render.Text(TEST, font="Dina_r400-6")
    
    )