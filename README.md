# NTUA Databases ΕΛΙΔΕΚ
## Το User Interface

![](https://imgur.com/a/7u1pWzm)


## Οδηγός Εγκατάστασης
- Αρχικά πρέπει να έχουμε εγκατεστημένο τον mysql-server (παρακάτω φαίνεται ένας σύντομος οδηγός εγκατάστασης)
Αρχικά εγκαθιστούμε τον mysql server
```
sudo apt-get update
sudo apt-get install mysql-server
```
Τέλος για να ρυθμίσω το password για τον mysql root user τρέχω την παρακάτω εντολή
```
sudo mysql_secure_installation
```
- Για το κομμάτι του web server deamon χρειαζόμαστε εγκατεστημένη την python3 και τον package manager που θα μας επιτρέψει να εγκαταστήσουμε το framework flask. Τα παραπάνω γίνονται με τις παρακάτω εντολές:
```
sudo apt install python3
```
```
sudo apt install pip
```
```
pip install flask
```
```
pip install mysql-connector-python
```
- Στο αρχείο app.py αλλάζουμε το password στην αρχή (για την πρόσβαση στην βάση) ώστε να είναι το ίδιο με αυτό που έχουμε για την MySQL βάση.
- Για να ανοίξει ο server και να έχουμε πρόσβαση στο ui ανοίγουμε ένα terminal στο directory του αρχείου app.py και τρέχουμε την παρακάτω εντολή.
```
python3 -m flask run
```
- Στην συνέχεια ανοίγουμε έναν browser και πληκτρολογούμε: 
`http://localhost:5000/ `

