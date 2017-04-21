class ConversationsController < ApplicationController
    def create 
        @conversation = Conversation.where(aid: current_user.id, bid: params[:id]).empty?
        if @conversation
            @conversation = Conversation.where(aid: params[:id], bid: current_user.id).empty?
            
            # if its still true then create a new conversation
            if @conversation
                @conversation = Conversation.new(bid: params[:id], aid: current_user.id)
                @conversation.save
                respond_to do |f|
                    f.json {render json: @conversation}
                end
            else
                respond_to do |f|
                    f.json {render json: @conversation}
                end
            end
        else
            # if false means conversation already exists
            respond_to do |f|
                f.json {render json: @conversation}
            end
        end
    end
end
