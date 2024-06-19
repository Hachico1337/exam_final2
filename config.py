import os
from dotenv import load_dotenv
import uuid

load_dotenv()

basedir = os.path.abspath(os.path.dirname(__file__))  # папка в которой лежит проект


# классы конфигурации
class Config:
    SECRET_KEY = uuid.uuid4().hex
    SQLALCHEMY_DATABASE_URI = 'sqlite:///' + os.path.join(basedir, 'library.db')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    FLASK_APP = os.environ.get('FLASK_APP')
    PROPAGATE_EXCEPTIONS = True
    UPLOAD_FOLDER = os.path.join(basedir, 'images')


class DevelopmentConfig(Config):
    DEBUG = True


class TestingConfig(Config):
    TESTING = True


class ProductionConfig(Config):
    SQLALCHEMY_DATABASE_URI = 'mysql+mysqlconnector://std_2588_exam_library:1324354657@std-mysql.ist.mospolytech.ru/std_2588_exam_library'
