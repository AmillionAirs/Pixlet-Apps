"""
Applet: Minnesota Light Rail
Summary: Train Departure Times
Description: Shows Light Rail Departure Times from Selected Stop.
Author: Alex Miller
"""

load("render.star", "render")
load("http.star", "http")
load("encoding/json.star", "json")
load("schema.star", "schema")

#Assign Default Stop Code
DEFAULT_STOP_CODE = "51408"

def main(config):
    #Establish API URL
    stop_code = config.get("stop_code", DEFAULT_STOP_CODE)
    url = "https://svc.metrotransit.org/NexTripv2/" + stop_code + "?format=json"
    MTT = http.get(url).json()

    #Find color and destination of first and second train and use that for rendering square color and 3 letter destination code
    if MTT["departures"][0]["route_short_name"] == "Blue":
        CB = "#00a"
        CT = "#fff"

        if MTT["departures"][0]["description"] == "to Mpls-Target Field":
            DB = "MTF"
        else:
            DB = "MOA"

    elif MTT["departures"][0]["route_short_name"] == "Green":
        CB = "#0a0"
        CT = "#fff"

        if MTT["departures"][0]["description"] == "to Mpls-Target Field":
            DB = "MTF"
        else:
            DB = "STP"

    else:
        CB = "#fa0"
        DB = MTT["departures"][0]["route_short_name"]
        CT = "#a00"        

    if MTT["departures"][1]["route_short_name"] == "Blue":
        CB2 = "#00a"
        CT2 = "#fff"

        if MTT["departures"][1]["description"] == "to Mpls-Target Field":
            DB2 = "MTF"
        else:
            DB2 = "MOA"

    elif MTT["departures"][1]["route_short_name"] == "Green":
        CB2 = "#0a0"
        CT2 = "#fff" 

        if MTT["departures"][1]["description"] == "to Mpls-Target Field":
            DB2 = "MTF"
        else:
            DB2 = "STP"

    else:
        CB2 = "#fa0"
        DB2 = MTT["departures"][1]["route_short_name"]
        CT2 = "#a00"           

    return render.Root(
        child = render.Column(
            children = [
                render.Marquee(
                    width = 64,
                    child = render.Text(MTT["stops"][0]["description"], font = "tb-8"),
                    offset_start = 5,
                    offset_end = 5,
                ),
                render.Box(width = 64, height = 1),
                render.Box(width = 64, height = 1, color = "#a00"),
                render.Row(
                    children = [
                        render.Stack(
                            children = [
                                render.Box(width = 12, height = 10, color = CB),
                                render.Column(
                                    children = [
                                        render.Text(DB, font = "CG-pixel-3x5-mono", color = CT),
                                        render.Text(MTT["departures"][0]["direction_text"], font = "CG-pixel-3x5-mono", color = "#000"),
                                    ],
                                ),
                            ],
                        ),
                        render.Box(width = 6, height = 10),
                        render.Text(MTT["departures"][0]["departure_text"], font = "Dina_r400-6"),
                    ],
                ),
                render.Box(width = 64, height = 1, color = "#a00"),
                render.Row(
                    children = [
                        render.Stack(
                            children = [
                                render.Box(width = 12, height = 10, color = CB),
                                render.Column(
                                    children = [
                                        render.Text(DB, font = "CG-pixel-3x5-mono", color = CT2),
                                        render.Text(MTT["departures"][1]["direction_text"], font = "CG-pixel-3x5-mono", color = "#000"),
                                    ],
                                ),
                            ],
                        ),
                        render.Box(width = 6, height = 10),
                        render.Text(MTT["departures"][1]["departure_text"], font = "Dina_r400-6"),
                    ],
                ),
                render.Box(width = 64, height = 1, color = "#a00"),
            ],
        ),
    )

def get_schema():
    return schema.Schema(
        version = "1",
        fields = [
            schema.Text(
                id = "stop_code",
                name = "Stop ID",
                desc = "Light Rail Station's Stop ID from (https://www.metrotransit.org/stops-stations)",
                icon = "subway",
            ),
        ],
    )
