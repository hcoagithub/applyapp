class VacantsController < ApplicationController
  before_action :set_vacant, only: %i[ show edit update destroy ]

  before_action :authenticate_user!, except: [:index, :show]

  before_action only: [:new, :create] do
    authorize_request(["author", "admin"])
  end

  before_action only: [:edit, :update, :destroy] do
    authorize_request(["admin"])
  end
 

  # GET /vacants or /vacants.json
  def index
    @vacants = Vacant.all
  end

  # GET /vacants/1 or /vacants/1.json
  def show
    @postulation= Postulation.new
    @postulation.vacant_id = params[:id]
    @postulation.user = current_user


  end

  # GET /vacants/new
  def new
    @vacant = Vacant.new
  end

  # GET /vacants/1/edit
  def edit
  end

 

  # POST /vacants or /vacants.json
  def create
    @vacant = Vacant.new(vacant_params)
    @vacant.user_id = current_user.id

    respond_to do |format|
      if @vacant.save
        format.html { redirect_to vacant_url(@vacant), notice: "Vacant was successfully created." }
        format.json { render :show, status: :created, location: @vacant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vacant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacants/1 or /vacants/1.json
  def update
    respond_to do |format|
      if @vacant.update(vacant_params)
        format.html { redirect_to vacant_url(@vacant), notice: "Vacant was successfully updated." }
        format.json { render :show, status: :ok, location: @vacant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vacant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacants/1 or /vacants/1.json
  def destroy
    @vacant.destroy

    respond_to do |format|
      format.html { redirect_to vacants_url, notice: "Vacant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacant
      @vacant = Vacant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vacant_params
      params.require(:vacant).permit(:title, :description, :salary, :user_id)
    end
end
