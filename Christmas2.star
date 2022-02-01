load("render.star", "render")
load("time.star", "time")
load("encoding/base64.star", "base64")

def main(config):
    #timezone = config.get("timezone") or "America/Chicago"
    #now = time.now().in_location(timezone)
    #now_date = now.format('2 JAN')
    #ANS = 'YES' if now_date == 'DEC 31' else 'NO'

    CTree1 = base64.decode("iVBORw0KGgoAAAANSUhEUgAAACAAAAAXCAYAAABqBU3hAAAAAXNSR0IArs4c6QAAAX1JREFUSEvFljFOBDEMRe0DQDccAo4w9FCAtFNQb4e4AeIEiBsguq0pZiW2gJ49AhyC6eAARg7rkSdKYgdYSJOVZsb/+dvxBqFiEREhIvInNLSEzRplrwgzeTUEk6UFPAF/Ks4aE4CcaAqMxU+fG3g4HICdCK4QUQi6ccmThAsgFeiknwWxVbfMxvAAYa3tLCriAlaCEGdiV0S3SJ+yUsRvuiVc9rPRHAsiV47qEsTZ68DfgRgBPKUoiVv9YDqQ7HR17nXtY/trXdBa7hLkst/r7uCtP58kWFOKIoAmteyvdUHedzmgxXnw8AAqrdiBUn+ZAN7MYzBvGcYRWjrznpGaescDUXRAsk81mhaMn8spiQFeAML4PgBA+Z0FsKz39EI8G1hUxGXHnaMFvXdz2O0XIamPpzla4rUl0U4wxP7QwmuzBt6TAJbA1dlxsFKv6/tHs6HDH9PQTr5Fuv2qy3guL+w7wq8CpErwtw5sbjGW6LaehwvJtoJ74v47wCccbO9E0vBuoAAAAABJRU5ErkJggg==")
    CTree2 = base64.decode("iVBORw0KGgoAAAANSUhEUgAAACAAAAAXCAYAAABqBU3hAAAAAXNSR0IArs4c6QAAAW1JREFUSEvlVjFywkAMlB4AnYt8AZ4AfVLEM3aRMkObL+QFfCEtkzKFPeMU0IcnwBdSuCMPuIzMiBEXne6MSZpcc4zFaVe70tkIynLOOURELcbPXDtzmG2Rd+u/VswEoYMWmaHglL8jYIIE1CDw/CODZt4CKRHLE1IhqkDo4H1VOIq9l7WaQytKe3YRAQZnciESKX2RzJ6T+eBDSSR5J6WTBHafrzC9eTwV2kcJztnLglD1MRWsJrdn3ZuAGAGrKQdPgQRvigryugz2WB8rki1IqV6zIjaOPwhoBxh8UjSwr/NT5VIJGbuqAn0ql56kkjgbQ7/6S8FjUyGJmj1gEfDtkEnZGl+FHUB3fU8BkH8HCVgXjtb+/qWkqUCgDM47jm5X7lAuYFytujNfmwUOld4nKJUgEpN2BvtsC7SrBGIvkeeHu05KuZZv66SRptf4WQ+4l6MvvPDp+I1grasS0Cz4UwI0ejHA34zjvyfwDalo90Q3Q145AAAAAElFTkSuQmCC")
    HPUMP1 = base64.decode("iVBORw0KGgoAAAANSUhEUgAAACAAAAAXCAYAAABqBU3hAAAAAXNSR0IArs4c6QAAAR5JREFUSEvVlrENwkAMRXMSjMA0WQDRU7MEDRNQwBLULECPMg0jgBRkJCPHsX3fAQmRMvH5P3/fOVea5NPf2r4suiKX7dbLfn++DN6haVOLSJwTM0QkbsFqsBQALZZJSZzeWdVbsJYrIwCEmoVlQg9Ctyt0oEZ9PzbvFng9nm+blKuQA4iwBkJBQtopwlkQF0CLzzbtK/fj1IUnzIqL3DABrMo/ASBiD2IEEIlz6Z4LDOnFWRADAK/ntcQsiMRpCAgAHatI3H8BaEtlb+U3uSdqbUg74EEgdlvHNgSgBcgp+JY45YHngBRFXNFHFZ4DLISOYW8vSOD0JMxCRC2p/ZSgXyfqBlq1jIMAMo7UKh5dSA7XVfWSge76KXHl1wBPawGZRixYGQ8AAAAASUVORK5CYII=")
    HPUMP2 = base64.decode("iVBORw0KGgoAAAANSUhEUgAAACAAAAAXCAYAAABqBU3hAAAAAXNSR0IArs4c6QAAARtJREFUSEvVlr0NwkAMhXNFRmAaFkD0bJKGCSjIJixAj5iGEVIEHXCR4/jn+YKEoOQcvy/PZzupAX/jYzumzT1J4cfDbjxdruKZlx56KIuXRBxijXjOCQHkQMmBLJ7Pom9Pc8EA1MoiTP9DIbibLwCrvlRk6JupFFpt2853deaAVd8igghzIARkugOaAzXCURD1DnDxtnunHnq7saQ4yw0RQHrzNQAZWYNYAFji5E6INhRILU6CmAFoNfcSF0EkjkNAAN44jZz/FwC3lNaWntHO8MoQdkCDQG3nbWsCfPp8MW5rITxxdRt6ExABQsTNdexBSK2nTcnwJFyzhL62C6JrOCpc4kMfJEhZ0DU8AZxve/cjA225mrj0a4An1KaKRqV6EnYAAAAASUVORK5CYII=")
    FourJ1 = base64.decode("iVBORw0KGgoAAAANSUhEUgAAACAAAAAXCAYAAABqBU3hAAAAAXNSR0IArs4c6QAAAOFJREFUSEtjZBhgwEgN+98KC/8HmSP89i3J5pGsAdnB/19b/3+ncQMuRJEDEmq7/689JYYRICd2xmMNJG0GBrDjYY4g1nL00IKHAC4HfNoRh9UBjIyMcL0gRzCKHiUqNGEOABkqdEMD4gsQIDcEyElDIEeALRc9ivAFJSFAqiOQQ2xAQgDZwSgOmN9UQrRnkNMA0ZqwKERxQGlzKdFmwXIBugZSywQUByxoLiUqJWNzJbllAtUcQE6ZANJDVQfAHEFsmUATBxCdiKAKqR4Cow4YDYHREBh6IdB92AvcoBwoAACp8pPTED4QrgAAAABJRU5ErkJggg==")
    FourJ2 = base64.decode("iVBORw0KGgoAAAANSUhEUgAAACAAAAAXCAYAAABqBU3hAAAAAXNSR0IArs4c6QAAAZNJREFUSEvtlrFKA0EQhncVFAQtrbTRTp8hL2AeQKtooW/glSKaMq8Q0DJNSkHrNGKtdql8gxRCBBmZxX9vdrKX7N2mTKrM3Gz+b/+ZOWJNzQ+dHlBwZDD2obXW+ueDseH4w0xd/RFtuBjFyPtEKgcRlQBnh+UxBkH8DwVBiGkQztcGkKAORkLwQyXOKa77tD/+KLvBsXMF2YubHg3fdmeMeH05j5pzbExgdwCi2lIFwQ4tBJg8d+LdEXa73qM1wpGrzru5bW2a/Z11pyOdwEwsBJjrABGx+Nfk180FhPg75+5GUw+gxZNbUOWAdO/y6dsB4LYQlzm9DTNb0GQG0JuYIEMx0N72WjlwouVwJGjBw/116jYGO60tZ+txe/mDnO+3t4LNCwCKbpEMwFugi9EKzrOQjFE7F+CxWzR+L2AQcfsqQQ0dONAUQM4ArJdtkNuxdIDYAMqZkJsQ62+WA1Xise3QvUdNFoDe/9gNYy8pWZcNIF+1ySskCrMAmggufQhzIVYOrBywvdFJ+C83d6pqnv8D0cov6k2tTNMAAAAASUVORK5CYII=")
    Jan1 = base64.decode("iVBORw0KGgoAAAANSUhEUgAAACAAAAAXCAYAAABqBU3hAAAAAXNSR0IArs4c6QAAAOZJREFUSEvNltENhCAMhstsvtwC7nAruIC3wu1wC7gdlxJrEEsF2ib6ImlN/4+fAgaoPxEAwp6mMb7zB/M9MaqHNVLNPFCi1ApzUC2xQ5TEMXAHYOkATTB3dghAmi0rUljbDCC0h11KWgI7FaHSswHiF2J4i32idkl0AAHSVnGEqAKQ+OnUcQDpAvBwoxuAHLFaFhaAs5/rNgsIFYDFkqgBtBDPA2hdf+3Mj2a+/ATsh490xFk03xCApTALULPfQ7gJwFOYBVjmV1ynLV0+OM774PPbTjsG82Vs5Gq8FOVESxj6xgLgD6OGWxhGeMP6AAAAAElFTkSuQmCC")
    Jan2 = base64.decode("iVBORw0KGgoAAAANSUhEUgAAACAAAAAXCAYAAABqBU3hAAAAAXNSR0IArs4c6QAAAfhJREFUSEutVjFuwzAMpJA1a+f+IkvGLP1A0a1zXlAg6NwWyAs6dwv6gSwZu+QXnbN6NVRQEYXjWXZiN15sWaR4Io8nBRGJIhLk/Ni3vvHRebRLts1qIfPD0XzlJc7iNrRljAvE0zKGu59gb5uzhXWMQVywZrWI88PRbMy3CsAma0AYhALmoAikgCQAmKWQ59yuZ7smtk/z9O/1/iu+/T6nb/1vi+q8A5DRcSZcFvOAs+ZqZUFqAKisaZgWi6elaH3GckD9SprO/qOfKU4dMgJ/mLhGbOQPEjwUAFortbJ6IVsprUMA0nrKC30TcR13MtJEQvdo4ARXW+ZTYlhLQFKZIzhhC5eKVOyQX8VusAQKIHmti04wKdGfM2Ppr2lM4VtpD2OtRbDgrqgeSAqoraQ229ByMlm8hkvA7VMDMJCN0eznWnUW6ANQHHM2EHhNiiFDHWHC1vBEzLW/tC3mRt9ZgCC42+oHx5UAsCS8U5boPnAJADtfSn+HbdQloAOuS2a7RpjsBQCeXrcAkI9pd9QjABO6rhBNSH8PV5zk4n0CxW4SgB5hquGoXXac3SgA1wTG3bHKw82rTDkAU8UHLx14iBkZNRpe3Zy6OnGn+l+zYwx+STdw3vxcBjaPD/F9tU+Hj36jw8f3vmPL/24CoBaUwZjNfwDYGn+PuEoT4q/hKAAAAABJRU5ErkJggg==")
    Easter1 = base64.decode("iVBORw0KGgoAAAANSUhEUgAAACAAAAAXCAYAAABqBU3hAAAAAXNSR0IArs4c6QAAAYxJREFUSEtjZGBg+K847TMDCNzP4mVAZoPE0PnEiMH0wMw8e8cSbD42wIjNAegOARlIihjIwpBdu+CeIugAZJfBLMMnhi9U1ri5MRirHIdrB6kFiVE1BGCGIYcKzBJkn8McSjcHwCxHT094HaA47fN/nOFDpgR6aICMweUIRmo7AJvlMH9gcwRNHIAcFTDfo4vBHEV1B6DHGsjXyJaj8we3A2DZDDm7kZIu0X2LnBZgoYIzBECW/u9qYGAsa4DTyEUsKQ7BFy0D4gBkBw1yB/xHLaMYGRnhtSMlUYARAsiJDSb5H8lykMUwPqmOiNgfCrdvheNqDHeDq2OQ4ciWoKsi1wEgy5EtReeD7AGnAXCKRwtunNUnkdFwb088QxXzN7ADNOtmMlxvSmcAOaAtZz+D0tU3cONp4gCQ5TDgfcgKzt66thrOhjkCwwGg4IYCRnDcgIIJIUZUIkSOd1whCYsaeDZEjwaYpdRIfOiOQE4XKOUAyBHIAL15RmpJiC0k0HMCo8/6AKo3SEgpIwAtEFF/JfwvoQAAAABJRU5ErkJggg==")
    Easter2 = base64.decode("iVBORw0KGgoAAAANSUhEUgAAACAAAAAXCAYAAABqBU3hAAAAAXNSR0IArs4c6QAAAaNJREFUSEvNlrFOwzAQhm0xFzHAAxTxBkyMDHRCAiGK4BHgAZi7wlx1YmFDohJ7F0Ym3gDBA7CRGQWdxe/+vjiOgxIgS5OL7f/zf+dL7XBWlKbHaz4aJVe3fQCI6PFi4YR/HQCCAGiC6MyBmDC8T7nQKYDedU4arDEmKMLhrHDgbxcD94tnjiGOMVxlMl7Hdez5ZcdPcQAsAiEGwQJ6HFYRQbwTu7e3ngJwrAlheY/7wAG9ewikXNHAAOC5sRjeZzvANvOONUAMSGoBc/TcaA3wIJ6oHYmlQNcK14s4qVOUPAV11LmNkxsSz+F4LYCIl9cTYy8n/reuCHOBuC/giP4JAAP/c4Ay/FBaayvnu639erxzIFbpJYmLMJ7bQpw+jr3m3e59hdcdQ1mcRSqUPwQQcRbVz6LjHeAdp2zNdWB8vmZWTvYcwOvGwGy+F0YAph9nZv3gaPktQAq6BBBxXFfzT3+/enPr7wFRcUB2+H1ZlxuxaRnLKkLOe52bSI0/hq7xqMKTyV0Un4bgugj6QNN3vG0njDmhT4Ldfzjs9V9xU5/4Al0oQX/7KK5sAAAAAElFTkSuQmCC")
    Thanks1 = base64.decode("")
    Thanks2 = base64.decode("")

    Today = time.now().in_location("America/Chicago")

    Xmas = time.time(year = time.now().year, month = 12, day = 25).in_location("America/Chicago") 
    XDAYS = int((Xmas - Today).hours // 24)
    HWEEN = time.time(year = time.now().year, month = 10, day = 31).in_location("America/Chicago")
    HDAYS = int((HWEEN - Today).hours // 24)
    NEWYEAR = time.time(year = time.now().year, month = 1, day = 1).in_location("America/Chicago")
    NDAYS = int((NEWYEAR - Today).hours // 24)
    Fourth = time.time(year = time.now().year, month = 7, day = 4).in_location("America/Chicago")
    FDAYS = int((Fourth - Today).hours // 24)

    if Today <= Fourth and Today >= NEWYEAR :
        DAY_TEXT = "4th of July"
        DAYS_UNTIL = FDAYS
        IMAGE1 = FourJ1 
        IMAGE2 = FourJ2

    elif Today <= HWEEN and Today >= Fourth :
        DAY_TEXT = "Halloween"
        DAYS_UNTIL = HDAYS
        IMAGE1 = HPUMP1 
        IMAGE2 = HPUMP2

    elif Today <= Xmas and Today >= HWEEN :
        DAY_TEXT = "Christmas"
        DAYS_UNTIL = XDAYS
        IMAGE1 = CTree1 
        IMAGE2 = CTree2   

    else:
        DAY_TEXT = "New Years"
        DAYS_UNTIL = NDAYS
        IMAGE1 = Jan1 
        IMAGE2 = Jan2 

    return render.Root(
        delay = 1000,
        child = render.Column(
            children=[
                render.Row(
                    cross_align="center",
                    children=[
                        render.Text(DAY_TEXT),
                    ],
                ),
                render.Box(width=64, height=1, color="#a00"),
                render.Row(
                    children=[
                        render.Animation(
                            children=[
                                #32x23
                                render.Image(src=IMAGE1),
                                render.Image(src=IMAGE2),
                            ],
                        ),
                        render.Column(
                            children=[
                                render.Text("In"),
                                render.Text("  " + str(DAYS_UNTIL)),
                                render.Text("    Days"),
                            ],
                        ),
                    ],
                ),
            ],
        ),
    )