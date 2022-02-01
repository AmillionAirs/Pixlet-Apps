load("render.star", "render")
load("time.star", "time")

def main(config):

    Today = time.now().in_location("America/Chicago")

    First_Day_of_Nov = time.time(year = time.now().year, month = 11, day = 2).in_location("America/Chicago") 
    Day_Of_Week = First_Day_of_Nov.format('Mon')

    if Day_Of_Week == 'Mon' :
          First_Day_of_Nov + time.time(day = 14)
     else:
          First_Day_of_Nov + time.time(day = 1)
    
    #XDAYS = int((Xmas - Today).hours // 24)

    return render.Root(
        child = render.Text(str(Day_Of_Week))
    )