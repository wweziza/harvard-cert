def main():
    while True:
        height_str = input("Height: ")
        if not height_str.strip():
            print("Invalid input. Please enter a positive integer.")
            continue

        if not height_str.isdigit():
            print("Invalid input. Please enter a positive integer.")
            continue

        height = int(height_str)

        if height < 1 or height > 8:
            print("Height must be between 1 and 8, inclusive.")
            continue

        break

    for i in range(1, height + 1):
        print(" " * (height - i) + "#" * i + "  " + "#" * i)

if __name__ == "__main__":
    main()
