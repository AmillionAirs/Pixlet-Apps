load("render.star", "render")
load("http.star", "http")
load("encoding/json.star", "json")
load("encoding/base64.star", "base64")

#F1_URL = "http://ergast.com/api/f1/2022/driverStandings"

def main(config):

    Mercedes = base64.decode("iVBORw0KGgoAAAANSUhEUgAAAA4AAAAHCAMAAAAPmYwrAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAz1BMVEUAAAD///8AGyt+jZW7xcWtuLumsrYtREwyTVgfPUkAGB4PHiavu7yhrrGfrK+bqKufq66aqKzDy8yrt7mUoqZ+j5Wst7mLmZ6JmJ6ElJp5i5LJ0dCaqKt7jJLCycuLmp9SanNXbndacHhebHFldnt6iY/Dy82os7ePnqK0vsDw8O5leX9TanIiP0hVbXWIl52FlptSaXFKYmt1iY+Qn6N8jJBHYGd4iZB8jZR0ho2DlJh8iYxncnaPnaORn6WZpqqQnqKCk5hld3wAAAD////BmiGlAAAARHRSTlMAAAAAAAAAAAAAAAArZnyDaTgBJmMaQ1sSWzcCXx5niQ5nCQhlCDfA0kgEYBUCYmGDWVCEYmwJKnkeE3A+LWlkYms6ARiX1DcAAAABYktHRAH/Ai3eAAAAB3RJTUUH5gIQFyEsgT6aNQAAAF5JREFUCNdjYGBgZOLh5eMXEBRiZgABFmERUTFxCUkpMI9BWkaWVU6eTUFRCcxVVlFVU9fQ1NLWAXN19fQNDI2MTUzNwFx2cwtLDk4raxtGMJeLwdbO3sHRyZmbgQEAbsMI6BPx2gMAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjItMDItMTZUMjM6MzM6NDMrMDA6MDAZnGoiAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIyLTAyLTE2VDIzOjMzOjQzKzAwOjAwaMHSngAAAABJRU5ErkJggg==")
    RedBull = base64.decode("iVBORw0KGgoAAAANSUhEUgAAAA4AAAAHCAMAAAAPmYwrAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAkFBMVEUAAAD7wibufDPtdTToWTn5syj6uyfraTbufTP2piv/5CL1pin0oSv1oyr0nyrmTzvqZjfrbDblSTzpXjjzniv8xCbvgDLscjXmTTz5tij6vSfpXzjpYDjwgzHscjXjPT7fKULufTPxijDgL0HhNEDraDbscTXmUDvmUjvxjDDzlC7nVTrlSTzqZzf0niz////6c/clAAAAL3RSTlMAAAAAAAAAAAAAAAAAAAAAAAAAAAAACgYXREodBwpLlsr2+dKdWig6Rm50STkvAU4tgvAAAAABYktHRC8j1CARAAAAB3RJTUUH5gIRAgEN+oKoNwAAAmR6VFh0UmF3IHByb2ZpbGUgdHlwZSB4bXAAADiNlVVbkpwwDPz3KXIEW5IlcxwG8F+q8pnjp9vszLLA1mZwFTaSrW69TPr7+0/6xaeZJ120R4vsxdUfXsMku3j18Mk3XUW2/ng8ugjkkxslNbTaqtnWyKbY23xK1mIOHKwas23VHDMMquKQiHbdJOsSTedojoO+EsyLZH774lsodYkIYGPeyUPnXfHaPph8moHswRP2OiG5NltrTkJyPYZIq2yaZQWfrI4V3wWyoqqmwSELpAJ9gb5jFryLSpIVU+iMrYJ35vHTkA/3BCxc5ypm5ifXJA0l3WthGFlnuNNjPLIFdsk2GMdAnjheTATvdQcAI/BFfhiRaHALCNR/ZQEKSBUSIT6NSE2IEHY89V4SAtYDgSWrPbDHXDDAtiLVF84DcPtMU8IHgu0r3GngxACWEXLIKL0Y17DKOjsFJN1Z/944KzHgHPZ0mgsd/ohrQikO+4zLnWM/O7XDpjvcp8mP+MzGrE1708DAYjShUVm2TJNNZqOy90OwbKObZpahqYk2xSe6JqPKiolVlGXBaGN2zNWKwq6VxBJUMVauXZjcIN8BAwpNK7BdYVkGD9nRsSL6BDxg2s5QraKmK7RsF5bkATgNZBaksiSdgasX5OkT+QBcj8DpPWQYY3VXJMfYOJXOd190TacrIeOS6mOTjlXm7VBVqduzRh1a8NVEX1xjJ7GLHFj4wJrlmA9VPPsP7qen/wi1vJvyY8bT8P+I/J8pP9daehdZeA+N6Eg/XjLpesuct+034kt6+Q3smnTzM6rMzXBH9v9I+gfI1olc/kDIjAAAAElJREFUCNdjYEAHjEzMLKxs7OwcnGAul5i4hKSUtIwshMstJ6+gqKSsosoD5vKqqWtoamnr6OqBuXzs/PwCgvxCwiJw40RFITQAzjUEhItFlQsAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjItMDItMTdUMDI6MDE6MTMrMDA6MDBe+17DAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIyLTAyLTE3VDAyOjAxOjEzKzAwOjAwL6bmfwAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAAASUVORK5CYII=")
    Ferrari = base64.decode("iVBORw0KGgoAAAANSUhEUgAAAA4AAAAHCAYAAAA4R3wZAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAESSURBVChTZZCxSgNBEIZnZnePBBUPwhVCMJXY2ci9Tmo7UcFGsLa28wkEsfMBLLSxEBsLEQXTJKLkgokmZPd2xr3jOAx+MOzO8v07MAgAEqrk6HAv082VmMQiAX8JkkLgHxby/ae7q7OL651KhToYRQC9hyhHEhRBvDxPRt/zWHW7L0tKsc4d+vaW1YVbQNUJ1oZGi2JBtX+8RvfPqjXIxrFpeB2+F2DhSi2pg8aUo9HmwQqXyYxgNEHwDtEzEi3zvFJL6qBzYSrwVEUMB7ufkG7PQGuGk9MEeu/Gh/BCcGE5Bf1XJegIBkODN7dN6axbm6ZT6Wz6Ru4rKfAvWCzp7VHlyEQfmRq2Erfa3vDh9S8Av/Yvb4PcL9m1AAAAAElFTkSuQmCC")
    
    
    #F1_NAME = http.get(F1_URL).json()["MRData"]

    return render.Root(
        child = render.Column(
            children = [
                render.Text("WCC Standings"),
                render.Box(width=64, height=1, color="#a0a"),
                render.Row(
                    children = [
                        render.Stack(
                            children = [
                                render.Image(src=Mercedes),
                                render.Text("1"),
                            ],
                        ),
                        render.Marquee(
                            width=64,
                            child=render.Text("Mercedes"),
                            offset_start=5,
                            offset_end=5,
                        ),
                    ],
                ),
                render.Row(
                    children = [
                        render.Stack(
                            children = [
                                render.Image(src=RedBull),
                                render.Text("2"),
                            ],
                        ),
                        render.Marquee(
                            width=64,
                            child=render.Text("Red Bull"),
                            offset_start=5,
                            offset_end=5,
                        ),
                    ],
                ),
                 render.Row(
                    children = [
                        render.Stack(
                            children = [
                                render.Image(src=Ferrari),
                                render.Text("3", font="5x8"),
                            ],
                        ),
                        render.Marquee(
                            width=64,
                            child=render.Text("Ferrari"),
                            offset_start=5,
                            offset_end=5,
                        ),
                    ],
                ),
            ],
        ),
    )