# NTUA Databases ELIDEK

## Dependencies
- Αρχικά πρέπει να έχουμε εγκατεστημένο τον mysql-server (παρακάτω φαίνεται ένας σύντομος οδηγός εγκατάστασης)
Αρχικά εγκαθιστούμε τον mysql server
``
sudo apt-get update
sudo apt-get install mysql-server
``
``
sudo mysql_secure_installation
``
- Για το κομμάτι του web server deamon χρειαζόμαστε εγκατεστημένη την python3 και τον package manager που θα μας επιτρέψει να εγκαταστήσουμε το framework flask. Τα παραπάνω γίνονται με τις παρακάτω εντολές:
``
sudo apt install python3
``
``
sudo apt install pip
``
``
pip install flask
``
