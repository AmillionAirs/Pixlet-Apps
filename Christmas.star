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


    Today = time.now().in_location("America/Chicago")

    Xmas = time.time(year = time.now().year, month = 12, day = 25).in_location("America/Chicago") 
    XDAYS = int((Xmas - Today).hours // 24)
    HWEEN = time.time(year = time.now().year, month = 10, day = 31).in_location("America/Chicago")
    HDAYS = int((HWEEN - Today).hours // 24)
    NEWYEAR = time.time(year = time.now().year, month = 1, day = 1).in_location("America/Chicago")
    NDAYS = int((NEWYEAR - Today).hours // 24)
    BDAY = time.time(year = time.now().year, month = 4, day = 20).in_location("America/Chicago")
    BDAYS = int((BDAY - Today).hours // 24)

    return render.Root(
        delay = 1000,
        child = render.Column(
            children=[
                render.Row(
                    cross_align="center",
                    children=[
                        render.Text("HALLOWEEN"),
                    ],
                ),
                render.Box(width=64, height=1, color="#a00"),
                render.Row(
                    children=[
                        render.Animation(
                            children=[
                                #32x23
                                render.Image(src=HPUMP1),
                                render.Image(src=HPUMP2),
                            ],
                        ),
                        render.Column(
                            children=[
                                render.Text("Days"),
                                render.Text("  Until"),
                                render.Text("     222"),
                            ],
                        ),
                    ],
                ),
            ],
        ),
    )