load("render.star", "render")
load("http.star", "http")
load("encoding/json.star", "json")

NUMBERS_URL = "https://www.powerball.com/api/v1/numbers/powerball/recent10?_format=json"
Next_Draw_URL = "https://powerball.com/api/v1/estimates/powerball?_format=json"
Winner_URL = "https://powerball.com/api/v1/draw-summary/powerball?_format=json"

def main():

    PB_NUMS = http.get(NUMBERS_URL).json()[0]["field_winning_numbers"]
    Draw_Date = http.get(NUMBERS_URL).json()[0]["field_draw_date"]
    Next_Draw_Date = http.get(Next_Draw_URL).json()[0]["field_next_draw_date"]
    Winner = http.get(Winner_URL).json()[0]["field_primary_winner_states"]
    Jackpot = http.get(Next_Draw_URL).json()[0]["field_prize_amount"]
    
    if Winner == "None" :
          Won = "0 Winners"
    else:
          Won = "1+ Winner"

    return render.Root(
          child = render.Column(
               children = [
                    render.Marquee(
                         width=64,
                         child=render.Text(Jackpot + "      ", font="tb-8"),
                         offset_start=5,
                         offset_end=5
                    ),
                    render.Stack(
                         children = [
                              render.Row(
                                   children = [
                                        render.Box(width=2, height=10),
                                        render.Circle(color="#FFF", diameter=10),
                                        render.Circle(color="#FFF", diameter=10),
                                        render.Circle(color="#FFF", diameter=10),
                                        render.Circle(color="#FFF", diameter=10),
                                        render.Circle(color="#FFF", diameter=10),
                                        render.Circle(color="#F00", diameter=10),
                                   ],
                              ),
                              render.Column(
                                   children = [
                                        render.Box(width=64, height=2),
                                        render.Row(   
                                             children = [
                                                  render.Box(width=3, height=4),
                                                  render.Text(content=PB_NUMS[0:2], color="#000",font="tom-thumb"),
                                                  render.Box(width=2, height=4),
                                                  render.Text(content=PB_NUMS[3:5], color="#000",font="tom-thumb"),
                                                  render.Box(width=2, height=4),
                                                  render.Text(content=PB_NUMS[6:8], color="#000",font="tom-thumb"),
                                                  render.Box(width=2, height=4),
                                                  render.Text(content=PB_NUMS[9:11], color="#000",font="tom-thumb"),
                                                  render.Box(width=2, height=4),
                                                  render.Text(content=PB_NUMS[12:14], color="#000",font="tom-thumb"),
                                                  render.Box(width=2, height=4),
                                                  render.Text(content=PB_NUMS[15:17], color="#000",font="tom-thumb"),
                                             ],
                                        ),
                                   ],
                              ),
                         ],
                    ),
                    render.Row(
                         children = [
                              render.Box(width=64, height=1, color="#0a0"),
                         ],
                    ),
                    render.Row(
                         children = [
                              render.Box(width=1, height=20),
                              render.Column(
                                   children = [
                                        render.Text(Draw_Date[5:7] + "/" + Draw_Date[8:10], font="tom-thumb"),
                                        render.Box(width=20, height=1),
                                        render.Text(Next_Draw_Date[5:7] + "/" + Next_Draw_Date[8:10], font="tom-thumb"),

                                   ],
                              ),
                              render.Box(width=2, height=20),
                              render.Column(
                                   children = [
                                        render.Text(Won, font="tom-thumb"),
                                        render.Box(width=38, height=1),
                                        render.Text("Upcomming", font="tom-thumb"),
                                   ],
                              ),
                         ],
                    ),
               ],
          ),
     )
