const numberToAlpha = {
  1: "I",
  5: "V",
  10: "X",
  50: "L",
  100: "C",
  500: "D",
  1000: "M",
}

const subtractedNumbers: { [key: number]: string } = {
  4: "IV",
  9: "IX",
  40: "XL",
  90: "XC",
  400: "CD",
  900: "CM",
}

function iterate(times: number, numeral: string): string {
  return [...Array(times)].map(_ => numeral).join("");
}

export const toRoman = (num: number): string => {
  let remainder = num
  let numeral = ""

  while (remainder > 0) {
    if (remainder >= 1000) {
      numeral = numeral + numberToAlpha[1000]
      remainder = remainder - 1000
    }

    else if (remainder >= 900) {
      numeral = numeral + subtractedNumbers[900]
      remainder = remainder - 900
    }

    else if (remainder >= 500) {
      numeral = numeral + numberToAlpha[500]
      remainder = remainder - 500
    }

    else if (remainder >= 400) {
      numeral = numeral + subtractedNumbers[400]
      remainder = remainder - 400
    }

    else if (remainder >= 100) {
      numeral = numeral + numberToAlpha[100]
      remainder = remainder - 100
    }

    else if (remainder >= 90) {
      numeral = numeral + subtractedNumbers[90]
      remainder = remainder - 90
    }

    else if (remainder >= 50) {
      numeral = numeral + numberToAlpha[50]
      remainder = remainder - 50
    }

    else if (remainder >= 40 && remainder < 50) {
      numeral = numeral + subtractedNumbers[40]
      remainder = remainder - 40
    }

    else if (remainder >= 10) {
      let multiples = Number(String(remainder)[0])
      numeral = numeral + iterate(multiples, numberToAlpha[10])
      remainder = remainder - (multiples * 10)
    }

    else if (remainder == 9) {
      numeral = numeral + subtractedNumbers[9]
      remainder = remainder - 9
    }

    else if (remainder >= 5) {
      numeral = numeral + numberToAlpha[5]
      remainder = remainder - 5
    }

    else if (remainder == 4) {
      numeral = numeral + subtractedNumbers[4]
      remainder = remainder - 4
    }

    else if (remainder > 0) {
      numeral = numeral + numberToAlpha[1]
      remainder = remainder - 1
    }
  }

  return numeral
}
