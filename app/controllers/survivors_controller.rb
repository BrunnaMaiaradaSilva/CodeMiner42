class SurvivorsController < ApplicationController
  before_action :set_survivor, only: [:show, :update_location]

  # GET /survivors
  # GET /survivors.json
  def index
    @survivors = Survivor.all
    render json: @survivors
  end

  # GET /survivors/1
  # GET /survivors/1.json
  def show
    render json: @survivors
  end

  # POST /survivors
  # POST /survivors.json
  def create
    @survivor = Survivor.new(survivor_params)

    respond_to do |format|
      if @survivor.save
        format.json { render :show, status: :created, location: @survivor }
      else
        format.json { render json: @survivor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /update_location/:id
  def update_location
    @survivor = Survivor.find_by(id: params[:id])

    if @survivor
      if @survivor.update(lat: params[:lat].to_s, long: params[:long].to_s)
        render json: @survivor
      else
        render json: @survivor.errors, status: :unprocessable_entity
      end
    else
      render json: {}, status: :not_found
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survivor
      @survivor = Survivor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survivor_params
      params.require(:survivor).permit(:name, :gender, :age, :latitude, :longitude)
    end   
end
