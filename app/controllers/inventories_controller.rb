class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :update]

  # GET /inventories
  # GET /inventories.json
  def index
    @inventories = Inventory.allo
    render json: @inventory
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
    render json: @inventory
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.json { render :show, status: :created, location: @inventory }
      else
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1
  # PATCH/PUT /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_params
      params.require(:inventory).permit(:water, :food, :medication, :ammunition)
    end
  end
end