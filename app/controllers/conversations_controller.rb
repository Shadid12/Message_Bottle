class ConversationsController < ApplicationController
    def create 
        @conversation = Conversation.where(aid: current_user.id, bid: params[:id]).empty?
        if @conversation
            @conversation = Conversation.where(aid: params[:id], bid: current_user.id).empty?
            
            # if its still true then create a new conversation
            if @conversation
                @conversation = Conversation.new(bid: params[:id], aid: current_user.id)
                @conversation.save
                create_msg
                respond_to do |f|
                    f.json {render json: @conversation}
                end
            else
                @conversation = Conversation.where(aid: params[:id], bid: current_user.id)
                create_msg
                respond_to do |f|
                    f.json {render json: @conversation}
                end
            end
        else
            # if false means conversation already exists
            @conversation = Conversation.where(aid: current_user.id, bid: params[:id])
            create_msg
            respond_to do |f|
                f.json {render json: @conversation}
            end
        end
    end
    
    def create_msg
        m = @conversation[0].pms.new(body: params[:message], sender_id: current_user.id)
        m.save
    end
    
    def index
        a = Conversation.where(aid: current_user.id)
        b = Conversation.where(bid: current_user.id)
        @conversations = a + b
    end
    
    def pms
        c = Conversation.find(params[:id])
        pms = c.pms
        respond_to do |f|
            f.json {render json: pms}
        end
    end
    
    def show
    end
    
end
