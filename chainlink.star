load("render.star", "render")
load("http.star", "http")
load("encoding/base64.star", "base64")
load("cache.star", "cache")

def main():
    # Variable and color declaration
    CHAINLINK_PRICE_URL = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=LINK" # CMC LINK URL with Parameter embedded
    CMC_API_KEY = "bdea3849-32ff-43d2-80d0-30fb7bec538c" # API KEY GET YOUR OWN
    link_24h_color="#FF0000" # red
    link_7d_color="#FF0000" # red
    ttl_seconds_control = 240 # global control of cache time
    # base64 encoded Pixel PNG
    LINK_ICON = base64.decode("iVBORw0KGgoAAAANSUhEUgAAABkAAAAZCAYAAADE6YVjAAAAiklEQVRIie2W0Q2AIAxEWaOJe8guMjUL6ZeJwdK7ivSLS/ij97iQFlIidBpi6i1jscwViRfwWb8A9qOOgZB5u9yg3uZc3uYsrAWol4zMCZB0UyAzD0yFeE7K7KVSMIJpFmRB5kFC+iSy42fNro2awsg8F3IKh70nDOiGIZkAFjQMeIDm/lY8yZj6C/REtc6NEfPuAAAAAElFTkSuQmCC")

    rate_cached = cache.get("link_price_cached") # Get cached rates
    if rate_cached != None:
      print("Printing cached data")
      link_7d_change = cache.get("link_7d_cached")
      link_24h_change = cache.get("link_24h_cached")
      link_price = cache.get("link_price_cached")
      #print("\n=============\nprice:", link_price, "\n24H:", link_24h_change, "\n7D:", link_7d_change, "\n24H:",link_24h_color, "\n7D:",link_7d_color, "\n=============") #Debug
    else:
      # API CALL to CMC
      print("Nothing cached. Calling API")
      rep = http.get(CHAINLINK_PRICE_URL, headers={"X-CMC_PRO_API_KEY": CMC_API_KEY })
      if rep.status_code != 200:
          fail("CMC request failed with status %d", rep.status_code)
      # Set prices, cache and round to hundredth because Skylark doesn't do that.
      link_price = float(int(rep.json()["data"]["LINK"]["quote"]["USD"]["price"]*100)/100)
      link_24h_change = float(int(rep.json()["data"]["LINK"]["quote"]["USD"]["percent_change_24h"]*100)/100)
      link_7d_change = float(int(rep.json()["data"]["LINK"]["quote"]["USD"]["percent_change_7d"]*100)/100)
      # Cache prices to not anger CMC
      cache.set("link_7d_cached", str(link_7d_change), ttl_seconds=ttl_seconds_control)
      cache.set("link_24h_cached", str(link_24h_change), ttl_seconds=ttl_seconds_control)
      cache.set("link_price_cached", str(link_price), ttl_seconds=ttl_seconds_control)
      #print("\n=============\nprice:", link_price, "\n24H:", link_24h_change, "\n7D:", link_7d_change, "\n24H:",link_24h_color, "\n7D:",link_7d_color, "\n=============") #Debug
      # set colors
      if float(link_24h_change) > 0:
        link_24h_color="#00FF00" #green
      elif float(link_24h_change) == 0:
        link_24h_color="#808080" #grey

      if float(link_7d_change) > 0:
        link_7d_color="#00FF00" #green
      elif float(link_7d_change) == 0:
        link_7d_color="#808080" #grey

    return render.Root(
        child = render.Column(
          children=[
            render.Row(
                main_align="space_evenly",
                cross_align="center",
                expanded=True,
                children = [
                    render.Image(src=LINK_ICON, width=22, height=22),
                    render.Column(
                      main_align="space_evenly",
                      cross_align="center",
                      expanded=True,
                      children=[
                        render.Text("LINK", height=7),
                        render.Text("$"+str(link_price), height=7),
                        render.Text(str(link_24h_change)+"%", color=link_24h_color, height=7),
                      ]
                    )

                ],
            ),
          ]
        ),
    )