# MT Exercise 3: Layer Normalization for Transformer Models

This repo is a collection of scripts showing how to install [JoeyNMT](https://github.com/joeynmt/joeynmt), download
data and train & evaluate models, as well as the necessary data for training your own model

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3.10 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps for macOS & Linux users

Clone this repository or your fork thereof in the desired place:

    git clone https://github.com/marpng/mt-exercise-03

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Make sure to install the exact software versions specified in the the exercise sheet before continuing.

Download Moses for post-processing:

    ./scripts/download_install_packages.sh


Train a model:

    ./scripts/train.sh

The training process can be interrupted at any time, and the best checkpoint will always be saved. It is also possible to continue training from there later on.

# Instruction by our team

## Directory structure
Please make sure your structure is as follows:
```
    └── 📁joeynmt
        └── 📁configs
        └── 📁docs
        └── 📁joeynmt
        └── 📁joeynmt.egg-info
    └── 📁mt-exercise-03
        └── 📁configs
        └── 📁data
        └── 📁extracted_ppls
        └── 📁logs
        └── 📁models
            └── 📁deen_transformer_postnorm
            └── 📁deen_transformer_prenorm
        └── 📁scripts
        └── 📁shared_models
        └── 📁tools
        └── validation_ppl_plot.png
        └── 📁venvs
```
- p.s. it might be that you'll have to run `pip install "numpy<2”` in your venv to ensure that numpy is downgraded.

## Directory changes that need to be made

### Run everything from the `msousa_spareek_mt_exercise03/mt-exercise-03` directory

### mt-exercise-03/configs/deen_transformer_prenorm.yaml and mt-exercise-03/configs/deen_transformer_postnorm.yaml

1. Under data please change the directories `train, dev and test` to your according full path to the files in the folder `data`


## How to solve the exercise
1. depending on which model you wish to run, change the line 20 in the `train.sh` file and run `./scripts/train.sh`
2. Under `scripts` you will find the bash file `extract_ppl.sh`, run the file with its full path to create the separate tabels and the `extracted_ppls/merged_table.csv`
3. In the same folder you will find `plot_ppl.py`, run `python ./scripts/plot_ppl.py` to create the final plot.
4. It might be that you get the message that you dont have permission to run a file, then run `chmod +x "FILE"` and run the the previous command again.

