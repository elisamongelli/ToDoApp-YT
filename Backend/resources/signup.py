from flask import request
from flask_restful import Resource
from models import db, User
import random
import string



class Signup(Resource):


    # ===== GET ALL USERS =====
    def get(self):

        users = User.query.all()

        # create list of Users to serialize
        users_list = []
        for i in range(len(users)):
            users_list.append(User.serialize(users[i]))
        
        return {
            "status" : "Success",
            "data" : users_list
        }, 200
    



    # ===== CREATE A USER =====
    # request payload:
            # {
            #      "username" : "string",
            #      "email" : "string",
            #      "password" : "string",
            #      "firstname" : "string",
            #      "lastname" : "string"
            # }
    # api_key value is valued inside the following post method
    
    def post(self):
        
        json_request = request.get_json()

        if not json_request:
            return {"message": "No input data provided"}, 400
        
        print("SONO NEL METODO POST DI SIGNUP")
        

        # id = json_request["id"]
        username = json_request["username"]
        email = json_request["email"]
        password = json_request["password"]
        firstname = json_request["firstname"]
        lastname = json_request["lastname"]


        # check if user already exists
        user_email = User.query.filter_by(EMAIL_ADDRESS=json_request['email']).first()
        user_username = User.query.filter_by(USERNAME=json_request['username']).first()
        
        # if email address already exists in the database, log in
        if user_email:
            return {
                "message" : "User already exists, please log in"
            }, 400
        
        # if email does not exists but username is already taken, choose another one
        if user_username:
            return {
                "message" : "Username is already taken, choose another one"
            }, 400
        

        api_key_length = 50

        # generate new random API_KEY and check if another user has the same one
        api_key = self.generate_key(api_key_length)
        user_api_key = User.query.filter_by(API_KEY=api_key).first()

        # generate new random API_KEY for the user until the API_KEY does not exists in the db
        while user_api_key:
            api_key = self.generate_key(api_key_length)
            user_api_key = User.query.filter_by(API_KEY=api_key).first()



        user = User(
            API_KEY = api_key,
            USERNAME = username,
            EMAIL_ADDRESS = email,
            PASSWORD = password,
            FIRST_NAME = firstname,
            LAST_NAME = lastname
        )
        

        # if email address and username OK ==> CREATE USER
        db.session.add(user)
        db.session.commit()


        return {
            "status" : "Success",
            "data" : User.serialize(user)
        }, 200
    
    
    def generate_key(self, length):
        return ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(length))
