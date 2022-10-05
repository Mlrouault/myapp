class ClientsController < ApplicationController
    skip_before_action :verify_authenticity_token
    # before_action :logged_in_user
  
    def home
    end
  
    def new
      @client  = current_user.clients.new
    end
  
    def index
      @clients = Client.all
    end
  
    def create
      @client = current_user.clients.build(client_params)
      if @client.save
        flash[:success] = "Successfully added to cart!"
        redirect_to @client
      else
        render 'new'
      end
    end
  
    def edit
      @client = current_user.clients.find(params[:id])
    end
  
    def update
      @client = current_user.clients.find(params[:id])
      if @client.update_attributes(client_params)
        flash[:success] = "Cart updated"
        redirect_to @client
      else
        render 'edit'
      end
    end
  
    def destroy
      @client = current_user.clients.find(params[:id])
      if @client 
        @client.destroy
        flash[:success] = "Client has been deleted"
      else
        flash[:alert] = "Error"
      end
      redirect_to root_path
    end
  
    def show
      @client = Client.find(params[:id])
    end
  
    private
  
    def client_params
      params.require(:client).permit(:name, :node_count, :user_id)
    end
end
