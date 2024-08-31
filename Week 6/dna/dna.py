import csv
import sys

def main():
    if len(sys.argv) != 3:
        sys.exit("Usage: python dna.py data.csv sequence.txt")

    database = []
    with open(sys.argv[1]) as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            database.append(row)

    with open(sys.argv[2]) as f:
        sequence = f.read()

    strs = list(database[0].keys())[1:]
    profile = {}
    for str in strs:
        profile[str] = longest_match(sequence, str)

    for person in database:
        if all(int(person[str]) == profile[str] for str in strs):
            print(person["name"])
            return

    print("No match")

def longest_match(sequence, subsequence):
    longest_run = 0
    subsequence_length = len(subsequence)
    sequence_length = len(sequence)

    for i in range(sequence_length):
        count = 0
        while True:
            start = i + count * subsequence_length
            end = start + subsequence_length
            if sequence[start:end] == subsequence:
                count += 1
            else:
                break
        longest_run = max(longest_run, count)

    return longest_run

if __name__ == "__main__":
    main()
