load("render.star", "render")
load("http.star", "http")
load("encoding/json.star", "json")
load("encoding/base64.star", "base64")

#F1_URL = "http://ergast.com/api/f1/2022/next.json"

def main(config):

    BAHRAIN = base64.decode("iVBORw0KGgoAAAANSUhEUgAAAB4AAAAYCAYAAADtaU2/AAAAAXNSR0IArs4c6QAAAixJREFUSEvFlrtrFFEUxn+b+MDECD4wCsYnKlYiFoKICGJlYWFp9/1hX2VrYScIilgIgiDpRCGiFgYtJMYgxhg5w53lzuTu7mx8ZLplzzm/8917zjfTY4ue3hZx6YNtr9dNSDoPzP/Lpmrwuu0GR9IZ4PUY8LPAPuAF8GNU3gbFkqibkHQY+DiqCHDN9uPsxCaBX8PyimBgwnaVKOkksDCkyJTtbyl2j+0lSZeA55sBR0O9Gp6KFtXXsyFpG7AGXLX9RNI0sDII3lAs6TZwL6BZwjHbbxO8XaxqTtJ14FHKmbT9M8UP3Jo2uOY1EjJVJ4Boot6AOOYVSXPAh6zZ47YXJB0F3pdUV4CscBEMTNtelnQIWExBAd9ue1XSBeBlDshqFgetKzgA1YpImkiKAxxHne//DmA1NTCTBu0y8KytugQedC+nbL+ppxdYSsViqG7avp/+uwU8SLt8xfZTSTPAcg4fBxx5u21/TYAwjFctJRdth4HEyYT6Ndsx6fG7IWgQ+Ijt4lDkoDCbwhPNVeoSbM72u7YflMAHbH9OicM8YNiK3rF9t1ZZ2PVqX/tGkRTcsP1wM8R2Tna8ubtVYkuKwyRO226sx7iNSNoFfK/zMtV7gS/jDte4/MYgZ/7f+5/gaOKg7UVJ5wI8a7t69aU7nuogK0yjbxwj4vuxmQlVd7zhI6AD+I9CJM1WYGA/sDPewx0rRlzX2GCEXwcnzOdTf6o7wv5q2JZ9Zf4Guh0TZfj1Q08AAAAASUVORK5CYII=")

    #F1_NAME = http.get(F1_URL).json()["MRData"]["RaceTable"]["Races"][0]["raceName"]
    #F1_DATE = http.get(F1_URL).json()["MRData"]["RaceTable"]["Races"][0]["date"]

    return render.Root(
        child = render.Column(
            children = [
                render.Text("Bahrain Grand Prix"),
                render.Box(width=64, height=1, color="#a0a"),
                render.Row(
                    children = [
                        render.Image(src=BAHRAIN),
                        render.Column(
                            children=[
                                render.Text("3/20/22", font="5x8"),
                                render.Text("9:00 AM"),
                                render.Text("# 1/27"),
                            ],
                        ),
                    ],
                ),
            ],
        ),
    )