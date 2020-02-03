import re


def is_isogram(string: str) -> bool:
    char_list = list(re.sub(r'\W', '', string.lower()))
    char_set = set(char_list)

    return len(char_list) == len(char_set)
