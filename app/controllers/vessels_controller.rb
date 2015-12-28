class VesselsController < ApplicationController
  before_action :set_vessel, only: [:show, :edit, :update, :destroy]

  # GET /vessels
  # GET /vessels.json
  def index
    @vessels = Vessel.all
  end

  # GET /vessels/new
  def new
    @vessel = Vessel.new
  end

  # GET /vessels/1/edit
  def edit
  end

  # POST /vessels
  # POST /vessels.json
  def create
    @vessel = Vessel.new(vessel_params)

    respond_to do |format|
      if @vessel.save
        format.html { redirect_to vessels_url, notice: 'Vessel was successfully created.' }
        format.json { render :show, status: :created, location: @vessel }
        if current_user.nil? or !current_user.admin?
          AdminMailer.new_vessel(request.ip, @vessel).deliver_now
        end
      else
        format.html { render :new }
        format.json { render json: @vessel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vessels/1
  # PATCH/PUT /vessels/1.json
  def update
    @vessel_before = @vessel.dup
    respond_to do |format|
      if @vessel.update(vessel_params)
        format.html { redirect_to vessels_url, notice: 'Vessel was successfully updated.' }
        format.json { render :show, status: :ok, location: @vessel }
        if current_user.nil? or !current_user.admin?
          AdminMailer.edit_vessel(request.ip, @vessel, @vessel_before).deliver_now
        end
      else
        format.html { render :edit }
        format.json { render json: @vessel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vessels/1
  # DELETE /vessels/1.json
  def destroy
    @vessel.destroy
    respond_to do |format|
      format.html { redirect_to vessels_url, notice: 'Vessel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vessel
      @vessel = Vessel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vessel_params
      params.require(:vessel).permit(:title, :description, :daily_price)
    end
end
