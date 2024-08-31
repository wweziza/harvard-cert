def main():
    while True:
        height_str = input("Height: ")
        try:
            height = int(height_str)
            if 1 <= height <= 8:
                break
        except ValueError:
            pass

    for i in range(1, height + 1):
        print(" " * (height - i) + "#" * i)

if __name__ == "__main__":
    main()
