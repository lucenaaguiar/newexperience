class MessagesController < ApplicationController
  def create
    @message = Message.new(msg_params)
    if @message.save

      redirect_to @message
    else
      flash.now[:error] = 'Não foi possível cadastra o passeio'
      redirect_to guides_path
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def msg_params
    params.require(:message).permit(:name, :phone, :email,
                                    :date_tour, :text_msg,
                                    tour: @tour)
  end
end
