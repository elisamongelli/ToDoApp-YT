from flask import request
from flask_restful import Resource
from models import db, User


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
            #      "id" : "string",
            #      "username" : "string",
            #      "email" : "string",
            #      "password" : "string",
            #      "firstname" : "string",
            #      "lastname" : "string"
            # }
    
    def post(self):
        
        json_request = request.get_json()

        if not json_request:
            return {"message": "No input data provided"}, 400
        

        id = json_request["id"]
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
        


        # TODO: modify API_KEY in the JSON PAYLOAD

        user = User(
            ID = id,
            API_KEY = "API_KEY",
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