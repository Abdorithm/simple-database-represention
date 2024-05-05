#!/usr/bin/env python3
"""Run the application"""
from package import app


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
