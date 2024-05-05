#!/usr/bin/env python3
"""Define the models"""
from package import db


class Bank(db.Model):
    __tablename__ = 'bank'
    code = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(45), nullable=False)
    address = db.Column(db.String(45), nullable=False)
    branches = db.relationship('Branch', backref='bank', lazy=True)

class Branch(db.Model):
    __tablename__ = 'branch'
    swift_code = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(45), nullable=False)
    address = db.Column(db.String(45), nullable=False)
    code = db.Column(db.Integer, db.ForeignKey('bank.code'))
    accounts = db.relationship('Account', backref='branch', lazy=True)
    loans = db.relationship('Loan', backref='branch', lazy=True)

class Account(db.Model):
    __tablename__ = 'account'
    account_num = db.Column(db.Integer, primary_key=True)
    balance = db.Column(db.Float, nullable=False)
    account_type = db.Column(db.String(45), nullable=False)
    swift_code = db.Column(db.Integer, db.ForeignKey('branch.swift_code'))
    cust_id = db.Column(db.Integer, db.ForeignKey('customer.cust_id'))

class Loan(db.Model):
    __tablename__ = 'loan'
    loan_id = db.Column(db.Integer, primary_key=True)
    amount = db.Column(db.Integer, nullable=False)
    loan_type = db.Column(db.String(45), nullable=False)
    swift_code = db.Column(db.Integer, db.ForeignKey('branch.swift_code'))
    cust_id = db.Column(db.Integer, db.ForeignKey('customer.cust_id'))

class Customer(db.Model):
    __tablename__ = 'customer'
    cust_id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(45), nullable=False)
    phone = db.Column(db.String(11), nullable=False)
    address = db.Column(db.String(45), nullable=False)
    accounts = db.relationship('Account', backref='customer', lazy=True)
    loans = db.relationship('Loan', backref='customer', lazy=True)
