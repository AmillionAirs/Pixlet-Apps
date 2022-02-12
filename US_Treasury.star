load("render.star", "render")
load("http.star", "http")
load("encoding/json.star", "json")

NUMBERS_URL = "https://api.fiscaldata.treasury.gov/services/api/fiscal_service/v2/accounting/od/debt_to_penny?sort=-record_date&format=json&page[number]=1&page[size]=1"
GOLD_URL = "https://api.fiscaldata.treasury.gov/services/api/fiscal_service/v2/accounting/od/gold_reserve?sort=-record_date&format=json&page[number]=1&page[size]=5"

def main(config):

    PB_NUMS = http.get(NUMBERS_URL).json()["data"][0]["tot_pub_debt_out_amt"]
    GOLD_LOC = http.get(GOLD_URL).json()["data"][0]["location_desc"]
    GOLD_AMT = http.get(GOLD_URL).json()["data"][0]["book_value_amt"]


    return render.Root(
        child = render.Column(
            children = [
                render.Text(str(GOLD_LOC), font="tom-thumb"),
                render.Text(str(GOLD_AMT), font="tom-thumb"),
            ],
        ),
    )