class TeachersController < ApplicationController

   def index
    render json: Teacher.all
   end

   def create
    render json: Teacher.create(teacher_params) 
   end

   private

   def teacher_params
     params.require(:teacher).permit(:first_name, :last_name, :email, :password) 
   end
end
