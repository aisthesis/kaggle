## Copyright (C) 2014 Marshall Farrier, Cintia de Barros

## Script to remove built files in case they may be corrupt.
## WARNING: It is not a good idea to run this script indiscriminately,
## as it does take time to rebuild the large files that are not
## stored in GitHub

disp("Warning! Continuing with this script will delete all built data files!")
disp("Rebuilding them will take several minutes.")
disp("Proceed only if you suspect that your version of these files may be corrupt!")
disp("Press ENTER to proceed or CTRL+C to abort")
pause;

PATH_TO_DATA = getenv("DATA_PATH");

fileName = [PATH_TO_DATA "train.mat"];
disp(["Deleting file '" fileName "'."])
fflush(stdout);
delete(fileName)

fileName = [PATH_TO_DATA "test.mat"];
disp(["Deleting file '" fileName "'."])
fflush(stdout);
delete(fileName)

fileName = [PATH_TO_DATA "trainonly.mat"];
disp(["Deleting file '" fileName "'."])
fflush(stdout);
delete(fileName)

fileName = [PATH_TO_DATA "cvonly.mat"];
disp(["Deleting file '" fileName "'."])
fflush(stdout);
delete(fileName)

disp("Built files deleted!")
fflush(stdout);
