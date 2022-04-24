load("render.star", "render")
load("http.star", "http")
load("encoding/json.star", "json")
load("time.star", "time")
load("encoding/base64.star", "base64")

F1_CONSTRUCTOR = dict(
    Mercedes = base64.decode("iVBORw0KGgoAAAANSUhEUgAAAA4AAAAHCAMAAAAPmYwrAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAz1BMVEUAAAD///8AGyt+jZW7xcWtuLumsrYtREwyTVgfPUkAGB4PHiavu7yhrrGfrK+bqKufq66aqKzDy8yrt7mUoqZ+j5Wst7mLmZ6JmJ6ElJp5i5LJ0dCaqKt7jJLCycuLmp9SanNXbndacHhebHFldnt6iY/Dy82os7ePnqK0vsDw8O5leX9TanIiP0hVbXWIl52FlptSaXFKYmt1iY+Qn6N8jJBHYGd4iZB8jZR0ho2DlJh8iYxncnaPnaORn6WZpqqQnqKCk5hld3wAAAD////BmiGlAAAARHRSTlMAAAAAAAAAAAAAAAArZnyDaTgBJmMaQ1sSWzcCXx5niQ5nCQhlCDfA0kgEYBUCYmGDWVCEYmwJKnkeE3A+LWlkYms6ARiX1DcAAAABYktHRAH/Ai3eAAAAB3RJTUUH5gIQFyEsgT6aNQAAAF5JREFUCNdjYGBgZOLh5eMXEBRiZgABFmERUTFxCUkpMI9BWkaWVU6eTUFRCcxVVlFVU9fQ1NLWAXN19fQNDI2MTUzNwFx2cwtLDk4raxtGMJeLwdbO3sHRyZmbgQEAbsMI6BPx2gMAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjItMDItMTZUMjM6MzM6NDMrMDA6MDAZnGoiAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIyLTAyLTE2VDIzOjMzOjQzKzAwOjAwaMHSngAAAABJRU5ErkJggg=="),
    Red Bull = base64.decode("iVBORw0KGgoAAAANSUhEUgAAAA4AAAAHCAMAAAAPmYwrAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAkFBMVEUAAAD7wibufDPtdTToWTn5syj6uyfraTbufTP2piv/5CL1pin0oSv1oyr0nyrmTzvqZjfrbDblSTzpXjjzniv8xCbvgDLscjXmTTz5tij6vSfpXzjpYDjwgzHscjXjPT7fKULufTPxijDgL0HhNEDraDbscTXmUDvmUjvxjDDzlC7nVTrlSTzqZzf0niz////6c/clAAAAL3RSTlMAAAAAAAAAAAAAAAAAAAAAAAAAAAAACgYXREodBwpLlsr2+dKdWig6Rm50STkvAU4tgvAAAAABYktHRC8j1CARAAAAB3RJTUUH5gIRAgEN+oKoNwAAAmR6VFh0UmF3IHByb2ZpbGUgdHlwZSB4bXAAADiNlVVbkpwwDPz3KXIEW5IlcxwG8F+q8pnjp9vszLLA1mZwFTaSrW69TPr7+0/6xaeZJ120R4vsxdUfXsMku3j18Mk3XUW2/ng8ugjkkxslNbTaqtnWyKbY23xK1mIOHKwas23VHDMMquKQiHbdJOsSTedojoO+EsyLZH774lsodYkIYGPeyUPnXfHaPph8moHswRP2OiG5NltrTkJyPYZIq2yaZQWfrI4V3wWyoqqmwSELpAJ9gb5jFryLSpIVU+iMrYJ35vHTkA/3BCxc5ypm5ifXJA0l3WthGFlnuNNjPLIFdsk2GMdAnjheTATvdQcAI/BFfhiRaHALCNR/ZQEKSBUSIT6NSE2IEHY89V4SAtYDgSWrPbDHXDDAtiLVF84DcPtMU8IHgu0r3GngxACWEXLIKL0Y17DKOjsFJN1Z/944KzHgHPZ0mgsd/ohrQikO+4zLnWM/O7XDpjvcp8mP+MzGrE1708DAYjShUVm2TJNNZqOy90OwbKObZpahqYk2xSe6JqPKiolVlGXBaGN2zNWKwq6VxBJUMVauXZjcIN8BAwpNK7BdYVkGD9nRsSL6BDxg2s5QraKmK7RsF5bkATgNZBaksiSdgasX5OkT+QBcj8DpPWQYY3VXJMfYOJXOd190TacrIeOS6mOTjlXm7VBVqduzRh1a8NVEX1xjJ7GLHFj4wJrlmA9VPPsP7qen/wi1vJvyY8bT8P+I/J8pP9daehdZeA+N6Eg/XjLpesuct+034kt6+Q3smnTzM6rMzXBH9v9I+gfI1olc/kDIjAAAAElJREFUCNdjYEAHjEzMLKxs7OwcnGAul5i4hKSUtIwshMstJ6+gqKSsosoD5vKqqWtoamnr6OqBuXzs/PwCgvxCwiJw40RFITQAzjUEhItFlQsAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjItMDItMTdUMDI6MDE6MTMrMDA6MDBe+17DAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIyLTAyLTE3VDAyOjAxOjEzKzAwOjAwL6bmfwAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAAASUVORK5CYII="),
    Ferrari = base64.decode("iVBORw0KGgoAAAANSUhEUgAAAA4AAAAHCAYAAAA4R3wZAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAESSURBVChTZZCxSgNBEIZnZnePBBUPwhVCMJXY2ci9Tmo7UcFGsLa28wkEsfMBLLSxEBsLEQXTJKLkgokmZPd2xr3jOAx+MOzO8v07MAgAEqrk6HAv082VmMQiAX8JkkLgHxby/ae7q7OL651KhToYRQC9hyhHEhRBvDxPRt/zWHW7L0tKsc4d+vaW1YVbQNUJ1oZGi2JBtX+8RvfPqjXIxrFpeB2+F2DhSi2pg8aUo9HmwQqXyYxgNEHwDtEzEi3zvFJL6qBzYSrwVEUMB7ufkG7PQGuGk9MEeu/Gh/BCcGE5Bf1XJegIBkODN7dN6axbm6ZT6Wz6Ru4rKfAvWCzp7VHlyEQfmRq2Erfa3vDh9S8Av/Yvb4PcL9m1AAAAAElFTkSuQmCC"),
    Williams = base64.decode("iVBORw0KGgoAAAANSUhEUgAAAA4AAAAHCAMAAAAPmYwrAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAflBMVEUAHz4AAAAAHj0AHDsAHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHj0AHz7///9gIEbQAAAAKHRSTlMAAAAACgwGAgdUvKEWBXgYoxSwiQlw9o0p2dN98KLvftVK7bK9IBAbf1SEUAAAAAFiS0dEKcq3hSQAAAAHdElNRQfmAhcCJQfO1P9TAAAAX0lEQVQI1w3MSQJAMBAF0e4vxhBiJuYQ7n9Cqd3bFIkwIkYcgykJBaWZzFEoVaCsspR0/TVt1/edGL5aE8ZpNsu6bvsxjSDQKS+rtb3k6cEIzP0Az20Cv2OGe+F7HZh/Fy4F0QjMFAkAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjItMDItMjNUMDI6Mzc6MDcrMDA6MDB1SXsLAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIyLTAyLTIzVDAyOjM3OjA3KzAwOjAwBBTDtwAAAABJRU5ErkJggg=="),
    Alpine F1 Team = base64.decode("iVBORw0KGgoAAAANSUhEUgAAAA4AAAAHCAMAAAAPmYwrAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAsVBMVEUAAAAAb7oAb7kAbrkAbroAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7kAb7kAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7r///84cqsHAAAAOnRSTlMAAAAAADDVxQwzv/qKCgs+wY/eSR55G0haY9AXO8h7iOXJxtd/Yg8JU3R2y+SCb4vtl3NEAthWTdojOksy3AAAAAFiS0dEOk4JxPoAAAAHdElNRQfmAhcCKzoIP57MAAAAYklEQVQI12NggABGRlY2dg5GKI+JkZOLm4eRESTOy8fIyC8gKCTMCBIXERVjFGeXkJSSZmZkYJKRZZOTV1CUU1JWUVVjUNfQ1NLW0dXTNzA0MjZhYGFilDA1Y2Q0t7AEagUA2hUG0AyU3BoAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjItMDItMjNUMDI6NDM6NTgrMDA6MDDrMbB/AAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIyLTAyLTIzVDAyOjQzOjU4KzAwOjAwmmwIwwAAAABJRU5ErkJggg=="),
    AlphaTauri = base64.decode("/9j/4AAQSkZJRgABAQAAAQABAAD/4QAuRXhpZgAATU0AKgAAAAgAAkAAAAMAAAABAFsAAEABAAEAAAABAAAAAAAAAAD/2wBDAAoHBwkHBgoJCAkLCwoMDxkQDw4ODx4WFxIZJCAmJSMgIyIoLTkwKCo2KyIjMkQyNjs9QEBAJjBGS0U+Sjk/QD3/wAALCAAHAA4BAREA/8QAFAABAAAAAAAAAAAAAAAAAAAABv/EACQQAAEDAwIHAQAAAAAAAAAAAAECAwUEESEGEwASFTJBUXGB/9oACAEBAAA/ADbjKkyVVQyrVb1Rp9bs3WJqAQ7Sg35UC/nGPn420dojTszNSsu1Rrcj1q2m2n1ElDoUdy2cjtsT7PH/2Q=="),
    Aston Martin = base64.decode("iVBORw0KGgoAAAANSUhEUgAAAA4AAAAHCAMAAAAPmYwrAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAsVBMVEUAAAAAb7oAb7kAbrkAbroAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7kAb7kAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7oAb7r///84cqsHAAAAOnRSTlMAAAAAADDVxQwzv/qKCgs+wY/eSR55G0haY9AXO8h7iOXJxtd/Yg8JU3R2y+SCb4vtl3NEAthWTdojOksy3AAAAAFiS0dEOk4JxPoAAAAHdElNRQfmAhcCKzoIP57MAAAAYklEQVQI12NggABGRlY2dg5GKI+JkZOLm4eRESTOy8fIyC8gKCTMCBIXERVjFGeXkJSSZmZkYJKRZZOTV1CUU1JWUVVjUNfQ1NLW0dXTNzA0MjZhYGFilDA1Y2Q0t7AEagUA2hUG0AyU3BoAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjItMDItMjNUMDI6NDM6NTgrMDA6MDDrMbB/AAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIyLTAyLTIzVDAyOjQzOjU4KzAwOjAwmmwIwwAAAABJRU5ErkJggg=="),
    Haas F1 Team = base64.decode("iVBORw0KGgoAAAANSUhEUgAAAA4AAAAHCAMAAAAPmYwrAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAA7VBMVEUAAADxCTLzCzP4DTH0DDPzCzL/chz0DDDtCTHzCzTsCTHxDTT1CzH0CzP1CzP2CzLyCjTzCjTzCjPzCjP0CjTzCzP0CzP0CzPzCzTzCzPzCzP0CzP0CzPzCzLzCzL0CzP1CzP0CzPzCzP0CzP0CjP0CzP0CzP0CzLyDC/zCzTzCzL0CzLzCzTzCzP0CzP0CzP0CzP1CzPzCzL0CzL0CzDqCTHyCzTzCzP0CzPzCzP0CzP0CzPzCzP0CzP0CzP0CzP0CzP1CzH0CzP0DDPzCzPzCzPzCzTzCzP1CzPzCzPyDDPzDDTzCzT1CjT///81BFTPAAAATnRSTlMAAAAAAAAAAAAAAAAAAAAACxgaEAErcX50fYN8TAhCs00RPZtHnNWEBy+5t1RwwZ+ajU/RHQEoYcq+wlOdiziWiAcqdoV0fHwIChgaEQIaa17CAAAAAWJLR0ROGWFx3wAAAAd0SU1FB+YCFwMAFKNbBF0AAABrSURBVAjXY2BgYGRiFhAUEhZhYWUAATZRMXEJSSlpGVl2BgYOTjl5BUUlZRVVNXUNIFdTS1tHV0/fwNDI2ISBwdTM3MLSytrG1s7ewZGBgYuT28nZxdXNXVrBgwdkFC8fv6eXt48vHx8DAwAB9gwkpTV3fgAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyMi0wMi0yM1QwMzowMDoyMCswMDowMFRj5gUAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjItMDItMjNUMDM6MDA6MjArMDA6MDAlPl65AAAAAElFTkSuQmCC"),
    McLaren = base64.decode("iVBORw0KGgoAAAANSUhEUgAAAA4AAAAHCAMAAAAPmYwrAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAyVBMVEUAAAD/1QD/swD//wD/ugD/qQD/sQD/vAD/uwD+lwD/ygD6lQDKeAD/7gD/twDykAD6lQD8lgD9lgD9lwD8lgDujgDkhwD7lQD9lwD+lwD+lwD+lwD+lwD+lwD+lwD+lwD9lwDbggD7lQD9lwD+lwD+lwD+lwD+lwD8lgD8lgD9lwD9lwD8lgD9lwD+lwD+lwD+lwD+lwD9lgDwjwD6lQD+lwD+lwD+lwD7lgDxkAD9lwD+lwD9lwDoigD0kQD8lgD4lAD+lwD///825eDDAAAAQXRSTlMAAAAAAAAAAAAAAAAAAAAMIzxPUTYJBSRXj73c7vX26FwEH12k2PPXNTlbYUNEXK36xzoHJunvkB4CWK5FBA5BEc5qJCUAAAABYktHREIQ1z30AAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH5gIXAxQ5yCqPfQAAAGFJREFUCNdjYAACRiZmfgFBIWERUQYGZhYxcQlJKWkZWTl5BQZFJWUVVTVHMFDXYNDU0hbW0dXTN3B0NDRiYDBmYGVj5+A0MTUzt+BiYODmARlmaWVtY8vLAAN29g58IBoAFEcKP1yC9RAAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjItMDItMjNUMDM6MjA6NTcrMDA6MDDDbWhTAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIyLTAyLTIzVDAzOjIwOjU3KzAwOjAwsjDQ7wAAAABJRU5ErkJggg=="),
    Alfa Romeo = base64.decode("iVBORw0KGgoAAAANSUhEUgAAAA4AAAAHCAMAAAAPmYwrAAAABGdBTUEAAK/INwWK6QAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAt1BMVEUAAADIx8epqKgNDA0ODQ4IBwjMy8zMy8uFg4S2tbW8u7usqquopqeKiIiVk5SzsrKrqqqhn5+lpKSIhoerqaq/vr6koqPCwcG4t7fGxcXm5eXEw8ORj5DY19jNzMzY2NjY19eQjo+Ni4vKycnX19fZ2NjIx8eMiorGxcaysLGLiYmpp6hyb3BXVVWura21s7RmY2SEgoNOS0yJh4jS0dGOjI3BwMFlYmOamZnp6Oja2trHxsf////yxuvBAAAAKHRSTlMAAAAAAAAAAByCw8OCHBq3/Py3G3T+dZ2edP51Grf8/LcbHILDw4IcXmehwgAAAAFiS0dEPKdqYc8AAAAHdElNRQfmAhcDGROmPzjmAAAAVElEQVQI12NgYGBg5ODk4ubhZWKAAD5+AQ1NQSFhZghXRFRLW0dXT4wFwhXXNzA0MjaRYIVwJaVMzcwtLKWhemVk5ays5RUUoVw2JWUVVTV1diATADtkBuuaie/6AAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIyLTAyLTIzVDAzOjI1OjE5KzAwOjAw8THWsAAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMi0wMi0yM1QwMzoyNToxOSswMDowMIBsbgwAAAAZdEVYdFNvZnR3YXJlAEFkb2JlIEltYWdlUmVhZHlxyWU8AAAAAElFTkSuQmCC"),
)

def main(config):
    timezone = config.get("timezone") or "America/Chicago"
    now = time.now().in_location(timezone)
    Year = now.format("2006")

    F1_URL = "http://ergast.com/api/f1/" + Year + "/constructorStandings.json"

    #Cache Data
    f1_cached = cache.get("f1_rate")

    if f1_cached != None:
        print("Hit! Displaying cached data.")
        f1_data = json.decode(f1_cached)
    else:
        print("Miss! Calling F1 Track data.")

        #Set API URLS
        F1_BASE_URL = "http://ergast.com/api/f1/" + Year + "/constructorStandings.json"
        F1_URL = http.get(F1_BASE_URL)

        Constructor1 = http.get(F1_URL).json()["MRData"]["StandingsTable"]["StandingsLists"][0]["ConstructorStandings"][0]["Constructor"]["name"]
        Constructor2 = http.get(F1_URL).json()["MRData"]["StandingsTable"]["StandingsLists"][0]["ConstructorStandings"][1]["Constructor"]["name"]
        Constructor3 = http.get(F1_URL).json()["MRData"]["StandingsTable"]["StandingsLists"][0]["ConstructorStandings"][2]["Constructor"]["name"]

        Points1 = http.get(F1_URL).json()["MRData"]["StandingsTable"]["StandingsLists"][0]["ConstructorStandings"][0]["points"]
        Points2 = http.get(F1_URL).json()["MRData"]["StandingsTable"]["StandingsLists"][0]["ConstructorStandings"][1]["points"]
        Points3 = http.get(F1_URL).json()["MRData"]["StandingsTable"]["StandingsLists"][0]["ConstructorStandings"][2]["points"]

        f1_data = dict(Constructor1 = Constructor1, Constructor2 = Constructor2, Constructor3 = Constructor3, Points1 = Points1, Points2 = Points2, Points3 = Points3)
        cache.set("f1_rate", json.encode(f1_data), ttl_seconds = 1600) 


    return render.Root(
        child = render.Column(
            children = [
                render.Text("WCC Standings"),
                render.Box(width=64, height=1, color="#a0a"),
                render.Row(
                    children = [
                        render.Stack(
                            children = [
                                render.Image(src=F1_CONSTRUCTOR.get(f1_data["Constructor1"], "Red Bull")),
                                render.Text("1"),
                            ],
                        ),
                        render.Marquee(
                            width=50,
                            child=render.Text(f1_data["Constructor1"] + " " + f1_data["Points1"] + " pts"),
                            offset_start=64,
                            offset_end=64,
                        ),
                    ],
                ),
                render.Row(
                    children = [
                        render.Stack(
                            children = [
                                render.Image(src=F1_CONSTRUCTOR.get(f1_data["Constructor2"], "Red Bull")),
                                render.Text("2"),
                            ],
                        ),
                        render.Marquee(
                            width=50,
                            child=render.Text(f1_data["Constructor2"] + " " + f1_data["Points2"] + " pts"),
                            offset_start=64,
                            offset_end=64,
                        ),
                    ],
                ),
                 render.Row(
                    children = [
                        render.Stack(
                            children = [
                                render.Image(src=F1_CONSTRUCTOR.get(f1_data["Constructor3"], "Red Bull")),
                                render.Text("3", font="5x8"),
                            ],
                        ),
                        render.Marquee(
                            width=50,
                            child=render.Text(f1_data["Constructor3"] + " " + f1_data["Points3"] + " pts"),
                            offset_start=64,
                            offset_end=64,
                        ),
                    ],
                ),
            ],
        ),
    )