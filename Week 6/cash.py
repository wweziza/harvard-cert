def main():
    while True:
        try:
            dollars = float(input("Change owed: "))
            if dollars >= 0:

                cents = round(dollars * 100)
                break
        except ValueError:
            pass

    coins = 0
    for value in [25, 10, 5, 1]:
        coins += cents // value
        cents %= value

    print(coins)

if __name__ == "__main__":
    main()
