load("render.star", "render")
load("http.star", "http")
load("encoding/json.star", "json")

#GSHEETS_URL = "http://ergast.com/api/f1/2022/next.json"

def main(config):

    #F1_NAME = http.get(F1_URL).json()["MRData"]["RaceTable"]["Races"][0]["raceName"]
    
    return render.Root(
        child = render.Column(
            children = [
                render.Text("Leads"),
                render.Box(width=64, height=1, color="#a0a"),
                render.Row(
                    expanded=True,
                    cross_align="end",
                    main_align="space_between",
                    children = [
                        render.Text("JAN"),
                        render.Text("3920"),
                    ],
                ),
                render.Row(
                    expanded=True,
                    cross_align="end",
                    main_align="space_between",
                    children = [
                        render.Text("FEB"),
                        render.Text("4940"),
                    ],
                ),
                render.Row(
                    expanded=True,
                    cross_align="end",
                    main_align="space_between",
                    children = [
                        render.Text("MAR"),
                        render.Text("9970"),
                    ],
                ),
            ],
        ),
    )
