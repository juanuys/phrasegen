# Intro

Random phrases using set parameters.

Why? I need a phrase generator to name my indie game dev studio. My web consultancy is called [Unleash Your Server](https://uys.io), which uses the letters from my surname.

I wanted to do this again. Undeniable Yellow Stain? Or Unconventional Yummy Salami? Only time will tell.

# Tech stuff

Dev/build:

    nvm use
    yarn add --dev parcel-bundler
    make run
    make dist

# Refresh word lists

You can add more words to the text files, and generate the requisite JSON from them.

```bash
cd word_lists
# add new words to .txt files, then recreate the JSON with:
./create.sh
```
