class UserparamsController < ApplicationController
before_action :authenticate_user!
before_action :get_userparam, exept: [:new, :create]
 
def index
if @userparam.nil?
redirect_to new_userparam_path
else
redirect_to userparam_path(@userparam.id)
end
end 



def show
end

def new
	@userparam = Userparam.new
end

def create
@userparam = current_user.build_userparam(userparams_params)
if @userparam.save
redirect_to userparam_path(@userparam.id)
else
render 'new'
end
end

def update
	@userparam.update(userparams_params)
	redirect_to userparam_path(@userparam.id)
end

private
def userparams_params
params.require(:userparam).permit(:user_id, :firstname, :lastname, :country, :city, :dofb, :phone, :avatar)
end

def get_userparam
@userparam = Userparam.find_by_user_id(current_user.id)
end

end