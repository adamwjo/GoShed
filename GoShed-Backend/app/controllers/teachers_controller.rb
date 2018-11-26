class TeachersController < ApplicationController

  skip_before_action :authorized, only: [:create, :index]
  
   def index
    render json: Teacher.all
   end

   def profile
     render json: {teacher: TeacherSerializer.new(current_user)}, status: :accepted
   end

   def create
    @teacher =  Teacher.create(teacher_params)
    if @teacher.valid?
      @token = encode_token(user_id: @teacher.id)
      render json: { teacher: TeacherSerializer.new(@teacher), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user'}, status: :not_acceptable
    end 
   end

   private

   def teacher_params
     params.require(:teacher).permit(:first_name, :last_name, :email, :password) 
   end
end
