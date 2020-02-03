def ordinal(num: int) -> str:
    number = ""

    if num == 1:
        number = "first"
    elif num == 2:
        number = "second"
    elif num == 3:
        number = "third"
    elif num == 4:
        number = "fourth"
    elif num == 5:
        number = "fifth"
    elif num == 6:
        number = "sixth"
    elif num == 7:
        number = "seventh"
    elif num == 8:
        number = "eighth"
    elif num == 9:
        number = "ninth"
    elif num == 10:
        number = "tenth"
    elif num == 11:
        number = "eleventh"
    elif num == 12:
        number = "twelfth"
    else:
        raise Exception("Unsupported number provided for ordinal conversion.")

    return number


def first_line(day: int) -> str:
    return "On the {} day of Christmas my true love gave to me: ".format(ordinal(day))


def last_line(day_num: int) -> str:
    verse = "a Partridge in a Pear Tree."

    return verse if day_num == 1 else "and " + verse


def daily_lyrics(day_num: int) -> str:
    lyrics = [
        "twelve Drummers Drumming, ",
        "eleven Pipers Piping, ",
        "ten Lords-a-Leaping, ",
        "nine Ladies Dancing, ",
        "eight Maids-a-Milking, ",
        "seven Swans-a-Swimming, ",
        "six Geese-a-Laying, ",
        "five Gold Rings, ",
        "four Calling Birds, ",
        "three French Hens, ",
        "two Turtle Doves, ",
        last_line(day_num),
    ]

    return "".join(lyrics[-day_num::1])


def recite(start_verse, end_verse):
    lyrics = []

    for day in range(start_verse, end_verse + 1):
        lyrics.append(first_line(day) + daily_lyrics(day))

    return lyrics
