class RecordingsController < ApplicationController
    skip_before_action :authorized

    def index
        render json: Recording.all
    end

    def create
        @recording = Recording.new
        @recording.user_id = params[:user_id]
        @recording.file.attach(params[:file])
        @recording.save
        render json: @recording
    end
end
