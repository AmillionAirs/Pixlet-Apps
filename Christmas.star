load("render.star", "render")
load("time.star", "time")
load("encoding/base64.star", "base64")

def main(config):
    #timezone = config.get("timezone") or "America/Chicago"
    #now = time.now().in_location(timezone)
    #now_date = now.format('2 JAN')
    #ANS = 'YES' if now_date == 'DEC 31' else 'NO'

    CTree = base64.decode("iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAN1JREFUOE9jZKAyYCRk3tk7lv/R1RirHMepj2QD8RkGspiggT7rA/436r4EO7L+sjjDlsANePUQZSC6l/EZitdAkOtWTHnGEJEjhRHUuAzFaSDIMHwRRrGB0t3pDE9LZ6LYgc1QrC7E5zr0IEA3FMNAmGEwF4EMKP7eiOE6ZKciG4rTQEIJnigDCUUEsqvRYx7mSrgL0Q3DlVxwuZyggaR4GaSWJANxuRY5KWEYmG61/T96OiPFlRgG4tPsZ6IHzjWbzlwimPfxKkA2iFhDCRqI7CpiDCXoBVLCEaQWAMT/dhVcIu3aAAAAAElFTkSuQmCC")
    #HPUMP = 

    Today = time.now().in_location("America/Chicago")

    Xmas = time.time(year = time.now().year, month = 12, day = 25).in_location("America/Chicago") 
    XDAYS = int((Xmas - Today).hours // 24)
    HWEEN = time.time(year = time.now().year, month = 10, day = 31).in_location("America/Chicago")
    HDAYS = int((HWEEN - Today).hours // 24)
    NEWYEAR = time.time(year = time.now().year, month = 1, day = 1).in_location("America/Chicago")
    NDAYS = int((NEWYEAR - Today).hours // 24)
    BDAY = time.time(year = time.now().year, month = 6, day = 26).in_location("America/Chicago")
    BDAYS = int((BDAY - Today).hours // 24)

    return render.Root(
        child = render.Column(
            children=[
                render.Row(
                    cross_align="center",
                    children=[
                        render.Text("Christmas"),
                    ],
                ),
                render.Box(width=64, height=1, color="#a00"),
                render.Row(
                    children=[
                        #32x23
                        render.Image(src=CTree),
                        render.Column(
                            children=[
                                render.Text("Days"),
                                render.Text("  Until"),
                                render.Text("     222"),
                            ],
                        ),
                    ],
                ),
            ],
        ),
    )