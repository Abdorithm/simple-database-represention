#!/usr/bin/python3
""" Starts a Flask Web Application """
import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import DeclarativeBase
from datetime import timedelta


class Base(DeclarativeBase):
    pass

db = SQLAlchemy(model_class=Base)

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mariadb+mariadbconnector://bank_db_usr:bank_db_pwd@localhost/bank_system'
db.init_app(app)

from package import routes