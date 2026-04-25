import nltk
nltk.download('punkt')
nltk.download('stopwords')
from nltk.tokenize import word_tokenize

# open your text file
with open("yourfile.txt", "r", encoding="utf-8") as file:
    text = file.read()

# tokenize (split into words)
words = word_tokenize(text)

# print results
print("Total words:", len(words))
print("First 20 words:", words[:20])