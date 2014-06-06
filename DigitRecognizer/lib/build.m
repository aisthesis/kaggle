## Copyright (C) 2014 Marshall Farrier, Cintia de Barros

## Script to build large files that don't work well (or at all)
## with GitHub

## Presupposes that train.csv and test.csv have been downloaded
## from https://www.kaggle.com/c/digit-recognizer/data
## and moved to the data/ directory for this project.

disp("Locating source data.");
PATH_TO_DATA = getenv("DATA_PATH");
filesMissing = 0;
fflush(stdout);

% Abort with error message if source files haven't been downloaded
fileName = [PATH_TO_DATA "train.csv"];
if !exist(fileName, "file")
    disp(["Error: source data file " fileName "does not exist!"]);
    disp("Please download data from https://www.kaggle.com/c/digit-recognizer/data and place in ../data/ folder");
    fflush(stdout);
    return;
endif

fileName = [PATH_TO_DATA "test.csv"];
if !exist(fileName, "file")
    disp(["Error: source data file " fileName "does not exist!"]);
    disp("Please download data from https://www.kaggle.com/c/digit-recognizer/data and place in ../data/ folder");
    fflush(stdout);
    return;
endif

disp("Source data files found.")
disp("Checking for files that need to be built.\n")
fflush(stdout);

fileName = [PATH_TO_DATA "train.mat"];
if exist(fileName, "file")
    disp(["File '" fileName "' exists."]);
else
    disp(["File '" fileName "' does not exist. Preparing to build file."]);
    filesMissing = 1;
endif
fileName = [PATH_TO_DATA "test.mat"];
if exist(fileName, "file")
    disp(["File '" fileName "' exists."]);
else
    disp(["File '" fileName "' does not exist. Preparing to build file."]);
    filesMissing = 1;
endif
fflush(stdout);

if filesMissing
    disp("Building missing matlab binary files from source data")
    disp("This will take a few minutes, so please be patient!")
    fflush(stdout);
    csvToMatBin();
    disp("matlab binary files created!\n")
endif
fflush(stdout);

if !filesMissing
    fileName = [PATH_TO_DATA "trainonly.mat"];
    if exist(fileName, "file")
        disp(["File '" fileName "' exists."]);
    else
        disp(["File '" fileName "' does not exist. Preparing to build file."]);
        filesMissing = 1;
    endif
    fileName = [PATH_TO_DATA "cvonly.mat"];
    if exist(fileName, "file")
        disp(["File '" fileName "' exists."]);
    else
        disp(["File '" fileName "' does not exist. Preparing to build file."]);
        filesMissing = 1;
    endif
endif
fflush(stdout);

if filesMissing
    disp("Building files to separate training and cross-validation data.")
    disp("This may take a minute, so please be patient!")
    fflush(stdout);
    separateCvData()
    disp("Separate datasets saved for training and cross-validation data.")
    disp("\nBuild complete!")
else
    disp("\nAll necessary files already present. No build required.")
    disp("If you suspect that your built files may be corrupt, first execute the command 'clean'")
    disp("to remove all built files, then run 'build' again.");
endif
fflush(stdout);

