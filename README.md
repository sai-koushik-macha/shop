# shop

## How to use ?

### Install required packages
```bash
sudo apt update
sudo apt install fzf gawk
```

### Usage
* Run the file shopping.sh.
* It shows options to choose from.
* The options are from stock.txt.
* Choose the item.
* Give the quantity and press enter.
* The temparary bill won't be printing till you press check.
* After items are completed you can press exit to end billing.
* It prints bill on terminal with total.

### Storing
* The bill automatically stores in HOME/billing directory of the user.
* Inside the billing directory you could find directory names by dates.
* Go to the particular directory.
* Inside that particular directory you see files named by the time.
* Check the particular file with specified time
