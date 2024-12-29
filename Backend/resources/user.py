from flask_restful import Resource

class User(Resource):
    def get(self):
        return {"message": "Get User!"}
    def post(self):
        return {"message": "Post User!"}