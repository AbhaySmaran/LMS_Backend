Leave Management System Backend:-

## Set Up the Database -

1. **Download the MySQL File**: - Download the MySQL database file (`lms.sql`) from the database directory.

2. **Import the Database**: - Open your MySQL Workbench or preferred MySQL client. - Create a new database or choose an existing one to import the data.

##Runnig the Django Server-

1.Create a virtual environment .
2.Then install the dependencies from requirements.txt file wich is inside lms_backend directory.(lms_backend is the root project directory).

	Commands:-

  -cd lms_backend
  -pip install -r requirements.txt

3.No migrations are needed as the database file provided already includes all necessary data and schema.

4.Modify the database configuration inside settings.py

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'lms',               ##Your database file name
        'HOST': 'localhost',
        'USER': 'root',
        ‘PASSWORD’:””,	         ##Your Mysql clint password
    }
}

5.Then run the server.

  -python manage.py runserver
