class UsersController < ApplicationController
    
    skip_before_action :authorized, only: [:create, :index, :addStudent, :assign_homework]

    def create
        @user = User.create(user_params)
        
        if @user.valid?
            @token = encode_token({ user_id: @user.id })
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def addStudent
        params.permit(:student_id, :teacher_id, :user_id)
        @student = User.find(params[:student_id])
        @student.teacher_id = params[:teacher_id]
        @student.save
        if(@student.save)
            render json: { message: 'Student added' }
        else
            render json: {message: 'failed' }, status: :not_acceptable
        end
    end

    def assign_homework
        @student = User.find(params[:student_id])
        @assignment = Assignment.find(params[:assignment_id])
        @homework = @assignment.clone
        @student.assignments << @homework
        @homework.users << @student
        @student.save
        if (@student.save)
            render json: { message: "got yo homework breh"}
        else
            render json: {message: 'failed' }, status: :not_acceptable
        end
    end

    def index
        render json: User.all
    end

    private

    def user_params
        params.require(:user).permit(:id, :first_name, :last_name, :password, :email, :account_type)
    end

end
