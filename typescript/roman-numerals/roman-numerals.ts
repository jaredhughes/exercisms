type RomanNumeral = string;

const numberToAlpha: { [key: number]: RomanNumeral } = {
  1: "I",
  4: "IV",
  5: "V",
  9: "IX",
  10: "X",
  40: "XL",
  50: "L",
  90: "XC",
  100: "C",
  400: "CD",
  500: "D",
  900: "CM",
  1000: "M",
}

function iterate(times: number, numeral: string): string {
  return [...Array(times)].map(_ => numeral).join("");
}


export const toRoman = (num: number): string => {
  let remainder = num
  let numeral = ""

  while (remainder > 0) {
    if (remainder >= 1000) {
      let multiples = Number(String(remainder)[0])
      numeral = numeral + iterate(multiples, numberToAlpha[1000])
      remainder = remainder - (multiples * 1000)
    }

    else if (remainder >= 900) {
      numeral = numeral + numberToAlpha[900]
      remainder = remainder - 900
    }

    else if (remainder >= 500) {
      numeral = numeral + numberToAlpha[500]
      remainder = remainder - 500
    }

    else if (remainder >= 400) {
      numeral = numeral + numberToAlpha[400]
      remainder = remainder - 400
    }

    else if (remainder >= 100) {
      let multiples = Number(String(remainder)[0])
      numeral = numeral + iterate(multiples, numberToAlpha[100])
      remainder = remainder - (multiples * 100)
    }

    else if (remainder >= 90) {
      numeral = numeral + numberToAlpha[90]
      remainder = remainder - 90
    }

    else if (remainder >= 50) {
      numeral = numeral + numberToAlpha[50]
      remainder = remainder - 50
    }

    else if (remainder >= 40 && remainder < 50) {
      numeral = numeral + numberToAlpha[40]
      remainder = remainder - 40
    }

    else if (remainder >= 10) {
      let multiples = Number(String(remainder)[0])
      numeral = numeral + iterate(multiples, numberToAlpha[10])
      remainder = remainder - (multiples * 10)
    }

    else if (remainder == 9) {
      numeral = numeral + numberToAlpha[9]
      remainder = remainder - 9
    }

    else if (remainder >= 5) {
      numeral = numeral + numberToAlpha[5]
      remainder = remainder - 5
    }

    else if (remainder == 4) {
      numeral = numeral + numberToAlpha[4]
      remainder = remainder - 4
    }

    else if (remainder > 0) {
      let multiples = Number(String(remainder)[0])
      numeral = numeral + iterate(multiples, numberToAlpha[1])
      remainder = remainder - multiples
    }
  }

  return numeral
}
