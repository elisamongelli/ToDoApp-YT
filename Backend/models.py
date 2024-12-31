from flask import Flask
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy


ma = Marshmallow()
db = SQLAlchemy()


class User(db.Model):
    __tablename__ = 'USERS'
    # __table_args__ = db.UniqueConstrint('ID', name='pk_users')

    ID = db.Column(db.String(500), primary_key=True)
    API_KEY = db.Column(db.String(500))
    USERNAME = db.Column(db.String(500))
    PASSWORD = db.Column(db.String(50))
    EMAIL_ADDRESS = db.Column(db.String(500))
    FIRST_NAME = db.Column(db.String(500))
    LAST_NAME = db.Column(db.String(500))

    def __init__(self, ID, API_KEY, USERNAME, PASSWORD, EMAIL_ADDRESS, FIRST_NAME, LAST_NAME):
        self.ID = ID
        self.API_KEY = API_KEY
        self.USERNAME = USERNAME
        self.PASSWORD = PASSWORD
        self.EMAIL_ADDRESS = EMAIL_ADDRESS
        self.FIRST_NAME = FIRST_NAME
        self.LAST_NAME = LAST_NAME
    
    def __repr__(self):
        return '<id {}>'.format(self.id)
    
    def serialize(self):
        return {
            'ID' : self.ID,
            'API_KEY' : self.API_KEY,
            'USERNAME' : self.USERNAME,
            'PASSWORD' : self.PASSWORD,
            'EMAIL_ADDRESS' : self.EMAIL_ADDRESS,
            'FIRST_NAME' : self.FIRST_NAME,
            'LAST_NAME' : self.LAST_NAME
        }
    


class Task(db.Model):
    __tablename__ = 'TASKS'
    # __table_args__ = tuple(db.UniqueConstrint('ITEM_KEY', 'USER_ID', name='pk_tasks'))

    ITEM_KEY = db.Column(db.String(50), primary_key=True)
    USER_ID = db.Column(db.String(500), primary_key=True)
    ITEMS_ORDER = db.Column(db.Integer)
    TITLE = db.Column(db.String(500))
    NOTES = db.Column(db.Text)
    START_DATE = db.Column(db.TIMESTAMP)
    END_DATE = db.Column(db.TIMESTAMP)
    COMPLETION_DATE = db.Column(db.TIMESTAMP)
    ISCOMPLETED = db.Column(db.Boolean)

    def __init__(self, ITEM_KEY, USER_ID, ITEMS_ORDER, TITLE, NOTES, START_DATE, END_DATE, COMPLETION_DATE, ISCOMPLETED):
        self.ITEM_KEY = ITEM_KEY
        self.USER_ID = USER_ID
        self.ITEMS_ORDER = ITEMS_ORDER
        self.TITLE = TITLE
        self.NOTES = NOTES
        self.START_DATE = START_DATE
        self.END_DATE = END_DATE
        self.COMPLETION_DATE = COMPLETION_DATE
        self.ISCOMPLETED = ISCOMPLETED
    
    def __repr__(self):
        return '<id {}>'.format(self.ITEM_KEY)
    
    def serialize(self):
        return {
            'ITEM_KEY' : self.ITEM_KEY,
            'USER_ID' : self.USER_ID,
            'ITEMS_ORDER' : self.ITEMS_ORDER,
            'TITLE' : self.TITLE,
            'NOTES' : self.NOTES,
            'START_DATE' : self.START_DATE,
            'END_DATE' : self.END_DATE,
            'COMPLETION_DATE' : self.COMPLETION_DATE,
            'ISCOMPLETED' : self.ISCOMPLETED
        }