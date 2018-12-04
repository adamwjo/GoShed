class HomeworksController < ApplicationController
    skip_before_action :authorized

    def index
        render json: Homework.all
    end

    def create
       @homework = Homework.new
       @homework.user_id = params[:user_id]
       @homework.message = params[:message]
       @homework.date = params[:date]
       @homework.save 
       render json: @homework
    end
end
