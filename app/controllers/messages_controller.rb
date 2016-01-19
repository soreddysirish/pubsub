class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
def index
  @messages = Message.all
  @message=Message.new
end

def create
   @message = Message.create(message_params)
   if @message.save
     respond_to do |format|
       format.js
     end
   end
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content)
    end
end
