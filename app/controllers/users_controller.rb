class UsersController < ApplicationController
  before_action :require_user, only: [:index, :show] 
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # respond_to :html, :json 

  def buy
    @requested_category_count = Inventory.where({category: params[:category]}).count
    if @requested_category_count < 20
      @inventory = Inventory.create({category: params[:category]})
      render :json => {message: "Successful POST", success: true, whatToUpdate: params[:category]}
    else
      render :json => {message: "Unsuccessful POST. Sold Out", success: false}
    end
  end

  def sell
    @requested_category_count = Inventory.where({category: params[:category]}).count
    if @requested_category_count > 0
      Inventory.last.destroy 
      render :json => {message: "Successful DELETE", success: true, whatToSell: params[:category]}
    else
      render :json => {message: "Unsuccessful DELETE", success: false}
    end
  end

  # GET /users
  # GET /users.json
  def index
    @user = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id.to_s
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :money, :address, :email, :password, :password_confirmation)
    end
end
