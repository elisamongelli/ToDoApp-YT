from flask_migrate import Migrate
from models import db
from run import create_app

app = create_app('config')

migrate = Migrate(app, db)


if __name__ == '__main__':
    app.run()