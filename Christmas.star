load("render.star", "render")
load("time.star", "time")
load("encoding/base64.star", "base64")

def main(config):
    #timezone = config.get("timezone") or "America/Chicago"
    #now = time.now().in_location(timezone)
    #now_date = now.format('2 JAN')
    #ANS = 'YES' if now_date == 'DEC 31' else 'NO'

    CTree = base64.decode("iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAN1JREFUOE9jZKAyYCRk3tk7lv/R1RirHMepj2QD8RkGspiggT7rA/436r4EO7L+sjjDlsANePUQZSC6l/EZitdAkOtWTHnGEJEjhRHUuAzFaSDIMHwRRrGB0t3pDE9LZ6LYgc1QrC7E5zr0IEA3FMNAmGEwF4EMKP7eiOE6ZKciG4rTQEIJnigDCUUEsqvRYx7mSrgL0Q3DlVxwuZyggaR4GaSWJANxuRY5KWEYmG61/T96OiPFlRgG4tPsZ6IHzjWbzlwimPfxKkA2iFhDCRqI7CpiDCXoBVLCEaQWAMT/dhVcIu3aAAAAAElFTkSuQmCC")

    Xmas = time.time(year = time.now().year, month = 12, day = 25).in_location("America/Chicago")
    Today = time.now().in_location("America/Chicago")
    DAYS = int((Xmas - Today).hours // 24)

    return render.Root(
        child = render.Box(
            child = render.Row(
                children=[
                    render.Image(src=CTree),
                    render.Text(str(DAYS)),
                ],
            ),
        ),
    )