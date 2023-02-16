
import json
from cleantext import clean

def clean_punctuation_errors(text : str) -> str:

    text = clean(text, lower= False, to_ascii = False)
    text = text.replace("…", "...").replace(" ...", "...").replace("$ ", "$").replace(" %", "%").replace("`` '' ", "\"").replace(" '' ''", "\"").replace("`` ", "\"").replace(" ''", "\"")
    text = text.replace(" .", ".").replace(" ,", ",").replace(" ?", "?").replace(" !", "!").replace(" ;", ";").replace(" :", ":").replace(" ` ", "`").replace(" '", "'")
    text = text.replace("( ", "(").replace("[ ", "]").replace("{ ", "{").replace(" )", ")").replace(" ]", "]").replace(" }", "}")
    text = text.replace("()", "").replace("{}", "").replace("[]", "")
    text = clean(text, lower= False, to_ascii = False)

    return text.strip()

def clean_data_split(split):

    with open(f"./data/vitaminc/{split}.jsonl", "r") as infile, open(f"{split}.jsonl", "w") as outfile:

        for line in infile:

            example = json.loads(line.strip())

            example["claim"] = clean_punctuation_errors(example["claim"])
            example["evidence"] = clean_punctuation_errors(example["evidence"])

            outfile.write(json.dumps(example) + "\n")

if __name__ == "__main__":

    clean_data_split("train")
    clean_data_split("dev")
    clean_data_split("test")

