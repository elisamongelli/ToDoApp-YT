from flask import request
from flask_restful import Resource


class Signup(Resource):


    def get(self):
        return {"message": "Get User for Signup!"}
    

    def post(self):
        
        # request payload:
            # {
            #      "username" : "string",
            #      "email" : "string",
            #      "password" : "string"
            # }
        
        json_data = request.get_json(force=True)
        
        print(json_data)

        username = json_data["username"]
        email = json_data["email"]
        password = json_data["password"]

        print("\n\nUsername = " + username +
              "\nEmail = " + email + 
              "\nPassword = " + password + "\n\n")

        if not json_data:
            return {"message": "No input data provided"}, 400

        # TODO: need to check if username already exists
        #   -redirect to signin
        #   -choose another username

        return {"message": "Create User {} for Signup!".format(username)}