class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
 
  def create
    @teacher = Teacher.find_by(email: user_login_params[:email])
    if @teacher && @teacher.authenticate(user_login_params[:password])
      token = encode_token({ teacher_id: @teacher.id })
      render json: { teacher: TeacherSerializer.new(@teacher), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end
 
  private
 
  def user_login_params
    
    params.require(:teacher).permit(:email, :password)
  end
end
