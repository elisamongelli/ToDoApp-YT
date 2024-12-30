from flask_restful import Resource


class Signup(Resource):


    def get(self):
        return {"message": "Get User for Signup!"}
    
    def post(self):
        return {"message": "Post User for Signup!"}