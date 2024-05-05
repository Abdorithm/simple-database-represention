""" The routes for our application """
from flask import render_template, url_for, flash, redirect, request
from package import app, db
from package.models import Bank, Branch, Account, Customer, Loan


with app.app_context():
    """ The database will work in the app context """
    db.create_all()

@app.route('/', strict_slashes=False)
def home():
    """ Renders the home page """
    banks = Bank.query.all()
    return render_template('home.html', banks=banks)

@app.route('/erd', strict_slashes=False)
def erd():
    """ Renders the erd page """
    return render_template('erd.html')

@app.route('/bank/<code>', strict_slashes=False)
def branch(code):
    """ Renders the branches page """
    bank = Bank.query.filter_by(code=code).first()
    return render_template('bank_choosed.html', branches=bank.branches, bank=bank)

@app.route('/bank/<code>/branch/<swift_code>', strict_slashes=False)
def dashboard(code, swift_code):
    """ Renders the branches page """
    bank = Bank.query.filter_by(code=code).first()
    branch = Branch.query.filter_by(swift_code=swift_code).first()
    accounts = branch.accounts
    customers = []
    for account in accounts:
       customers.extend(Customer.query.filter_by(cust_id=account.cust_id).all())
    return render_template('branch_choosed.html', bank=bank, branch=branch,
                           accounts=accounts, customers=customers)

@app.route('/customer/<cust_id>', strict_slashes=False)
def customer(cust_id):
    """ Renders the branches page """
    banks = Bank.query.all()
    branches = Branch.query.all()
    current_cust = Customer.query.filter_by(cust_id=cust_id).first()
    return render_template('cust_choosed.html', current_cust=current_cust,
                           accounts=current_cust.accounts, loans=current_cust.loans,
                           banks=banks, branches=branches)
