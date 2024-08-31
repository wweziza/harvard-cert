def is_valid(number):
    digits = [int(digit) for digit in str(number)]
    total_sum = 0

    for i in range(-2, -len(digits) - 1, -2):
        doubled = digits[i] * 2
        total_sum += doubled // 10 + doubled % 10

    for i in range(-1, -len(digits) - 1, -2):
        total_sum += digits[i]

    return total_sum % 10 == 0

def determine_card_type(number):
    number_str = str(number)
    length = len(number_str)

    if length == 15 and number_str.startswith(('34', '37')):
        print("AMEX")
    elif length == 16 and number_str.startswith(('51', '52', '53', '54', '55')):
        print("MASTERCARD")
    elif (length == 13 or length == 16) and number_str.startswith('4'):
        print("VISA")
    else:
        print("INVALID")

def main():
    try:
        number = int(input("Number: "))
        if is_valid(number):
            determine_card_type(number)
        else:
            print("INVALID")
    except ValueError:
        print("INVALID")

if __name__ == "__main__":
    main()
