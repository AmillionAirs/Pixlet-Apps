load("render.star", "render")
load("http.star", "http")
load("time.star", "time")
load("encoding/json.star", "json")
load("schema.star", "schema")
load("secret.star", "secret")

DEFAULT_LOCATION = """
{
	"lat": "40.6781784",
	"lng": "-73.9441579",
	"description": "Brooklyn, NY, USA",
	"locality": "Brooklyn",
	"place_id": "ChIJCSF8lBZEwokRhngABHRcdoI",
	"timezone": "America/New_York"
}
"""

OAUTH2_CLIENT_SECRET = secret.decrypt("528093114922-rc1a2smpq3t4ihp7lfq2g12v4bt3r7jt.apps.googleusercontent.com")

EXAMPLE_PARAMS = """
{"code": "your-code", "grant_type": "authorization_code", "client_id": "your-client-id", "redirect_uri": "https://appauth.tidbyt.com/your-app-id"}
"""

def main(config):

    location = config.get("location", DEFAULT_LOCATION)
    loc = json.decode(location)
    timezone = loc["timezone"]

    now = time.now().in_location(timezone)
    Month = now.format("January")

    token = config.get("auth")

    if token:
        msg = "Authenticated"
    else:
        msg = "Unauthenticated"


    if Month == "January":
        Leads = "3,920"
        Lending = "320" + "M"
        Revenue = "12.3" + "M"

    elif Month == "February":
        Leads = "4,920"
        Lending = "320" + "M"
        Revenue = "12.3" + "M"

    elif Month == "March":
        Leads = "5,920"
        Lending = "320" + "M"
        Revenue = "12.3" + "M"

    elif Month == "April":
        Leads = "6,920"
        Lending = "320" + "M"
        Revenue = "12.3" + "M"

    elif Month == "May":
        Leads = "3,920"
        Lending = "320" + "M"
        Revenue = "12.3" + "M"

    elif Month == "June":
        Leads = "3,920"
        Lending = "320" + "M"
        Revenue = "12.3" + "M"

    elif Month == "July":
        Leads = "3,920"
        Lending = "320" + "M"
        Revenue = "12.3" + "M"

    elif Month == "August":
        Leads = "3,920"
        Lending = "320" + "M"
        Revenue = "12.3" + "M"

    elif Month == "September":
        Leads = "3,920"
        Lending = "320" + "M"
        Revenue = "12.3" + "M"

    elif Month == "October":
        Leads = "3,920"
        Lending = "320" + "M"
        Revenue = "12.3" + "M"

    elif Month == "November":
        Leads = "3,920"
        Lending = "320" + "M"
        Revenue = "12.3" + "M"

    else:
        Leads = "3,920"
        Lending = "320" + "M"
        Revenue = "12.3" + "M"


    return render.Root(
        child = render.Column(
            children = [
                render.Row(
                    expanded=True,
                    main_align="center",
                    children = [
                        render.Text(Month),
                    ],
                ),
                render.Box(width=64, height=1, color="#a0a"),
                render.Row(
                    expanded=True,
                    cross_align="end",
                    main_align="space_between",
                    children = [
                        render.Text("LEADS"),
                        render.Text(Leads),
                    ],
                ),
                render.Row(
                    expanded=True,
                    cross_align="end",
                    main_align="space_between",
                    children = [
                        render.Text("LENDING"),
                        render.Text(Lending),
                    ],
                ),
                render.Row(
                    expanded=True,
                    cross_align="end",
                    main_align="space_between",
                    children = [
                        render.Text("REVENUE"),
                        render.Text(Revenue),
                    ],
                ),
            ],
        ),
    )

def oauth_handler(params):
    # deserialize oauth2 parameters, see example above.
    params = json.decode(params)

    # exchange parameters and client secret for an access token
    res = http.post(
        url = "https://www.googleapis.com/auth/spreadsheets.readonly",
        headers = {
            "Accept": "application/json",
        },
        form_body = dict(
            params,
            client_secret = OAUTH2_CLIENT_SECRET,
        ),
        form_encoding = "application/x-www-form-urlencoded",
    )
    if res.status_code != 200:
        fail("token request failed with status code: %d - %s" %
             (res.status_code, res.body()))

    token_params = res.json()
    access_token = token_params["access_token"]

    return access_token

def get_schema():
    return schema.Schema(
        version = "1",
        fields = [
            schema.OAuth2(
                id = "auth",
                name = "Google",
                desc = "Connect your Google account.",
                icon = "github",
                handler = oauth_handler,
                client_id = "your-client-id",
                authorization_endpoint = "https://www.googleapis.com/auth/spreadsheets.readonly",
                scopes = [
                    "read:user",
                ],
            ),
        ],
    )