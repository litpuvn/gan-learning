from os import listdir
from os.path import isfile, join


mypath = 'output'
filenames = [join(mypath, f) for f in listdir(mypath) if isfile(join(mypath, f))]

header = ["anger","anticipation","disgust","fear","joy","sadness","surprise","trust"]
with open('merged_comments.csv', 'w') as outfile:
    outfile.write(','.join(header) + '\n')

    for fname in filenames:
        if '.out.' not in fname:
            continue

        with open(fname) as infile:
            in_header = True
            for line in infile:
                if in_header:
                    in_header = False
                    continue
                outfile.write(line)