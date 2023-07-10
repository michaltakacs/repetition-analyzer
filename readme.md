# Repetition Analyzer

The Repetition Analyzer is an Elixir script designed to find the most frequently used words in a text file, excluding common stop words (see [Wikipedia](https://en.wikipedia.org/wiki/Stop_word) for definition), like "we", "at", "which", etc. It can be used to analyze documents for repetitive language, helping you improve your writing style.

## How it works

- **Reads a plain text file**: You can provide any text file as input, and the script will analyze it.
- **Excludes stop words**: Commonly used words ("the", "is", "at", etc.) are excluded from the analysis. The list of stop words is already provided in `stop_words.txt` but feel free to use your own stop words file.
- **Case insensitive**: The script treats "Word" and "word" as the same.

## Prerequisites
- You need to have Elixir installed so that you can run the script on your machine.

## Usage

1. **Check out the git project**:
   Clone the project to your local machine using `git`, or simply copy the `repetition_analyzer.exs` script and the list of stop words `stop_words.txt`.

2. **Run the script**:
   The script is designed to be run from the command line. You'll need to provide three arguments:

   - `filename`: The name of the file you want to analyze.
   - `stopwords_file`: The name of the file containing stop words which are separated by a newline.
   - `top_count`: The number of most frequently used words you want to display.

   For example:

   ```bash
   elixir repetition_analyzer.exs example_documents/cv.txt stop_words.txt 20

## Ideas for further development
- Utilize a public API such as https://www.ranks.nl/stopwords to acquire the list of stop words, which would enable multilingual support.
- Create a web application, enabling users to paste any text into a provided text field. Additionally, a field could be introduced to add or remove stop words dynamically from the default list.
