import re


def sanitise_string(string: str) -> str:
    return re.sub(r"\_|[^\w']+", ',', string.lower()).strip(',')


def sanitise_words(words: list) -> list:
    results = []

    for w in words:
        word = re.sub(r"^['\']|['\']$", "", w)
        results.append(word)

    return results


def count_words(sentence: str) -> dict:
    sanitised_string = sanitise_string(sentence)
    sanitised_words = sanitise_words(sanitised_string.split(','))
    results = {}

    for w in sanitised_words:
        results.update([(w, sanitised_words.count(w))])

    return results
