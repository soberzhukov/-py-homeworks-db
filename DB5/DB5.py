import sqlalchemy
from pprint import pprint


db = 'postgresql://log:pas@localhost:5432/namedb'
engine = sqlalchemy.create_engine(db)
connection = engine.connect()


def create_or_insert_request(insert_file):
    with open(insert_file) as f:
        insert_str = ''
        for line in f:
            if line == '\n':
                connection.execute(insert_str)
                insert_str = ''
            insert_str += line


def select_request(select_file):
    with open(select_file) as f:
        insert_str = ''
        for line in f:
            if line == '\n':
                res = connection.execute(insert_str).fetchall()
                insert_str = ''
                pprint(res)
            insert_str += line

# create_or_insert_request('CREATE.sql')
# create_or_insert_request('INSERT.sql')
# select_request('SELECT.sql')