from flask import Flask
from flask_migrate import Migrate


def create_app(config_filename):
    app = Flask(__name__)
    app.config.from_object(config_filename)
    
    from app import api_bp
    app.register_blueprint(api_bp, url_prefix='/api')

    from models import db
    db.init_app(app)

    Migrate(app,db)

    return app


# export app as Flask CLI object (flask_script deprecated)
app = create_app("config")

if __name__ == "__main__":
    app.run(debug=True)