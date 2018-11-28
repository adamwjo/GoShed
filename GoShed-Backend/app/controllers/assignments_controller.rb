class AssignmentsController < ApplicationController
    skip_before_action :authorized
    def index
        render json: Assignment.all 
    end

    def create
        @assignment = Assignment.new
        @assignment.user_id = params[:user_id]
        @assignment.file = params[:file]
        @assignment.save
        render json: @assignment
    end

    private

   

   
end
