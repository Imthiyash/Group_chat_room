class MessagesController < ApplicationController
    before_action :authenticate_user!

    def new
    end

    def create
        params.permit(:body,:id)
        @message = Message.new(
            body: params[:body],
            group_id: params[:id],
            user_id: current_user.id
        )
        @message.save
    end
end