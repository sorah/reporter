class IncidentTypesController < ApplicationController
  before_action :set_incident_type, only: [:show, :edit, :update, :destroy]

  # GET /incident_types
  # GET /incident_types.json
  def index
    @incident_types = IncidentType.all
  end

  # GET /incident_types/1
  # GET /incident_types/1.json
  def show
  end

  # GET /incident_types/new
  def new
    @incident_type = IncidentType.new
  end

  # GET /incident_types/1/edit
  def edit
  end

  # POST /incident_types
  # POST /incident_types.json
  def create
    @incident_type = IncidentType.new(incident_type_params)

    respond_to do |format|
      if @incident_type.save
        format.html { redirect_to @incident_type, notice: 'Incident type was successfully created.' }
        format.json { render :show, status: :created, location: @incident_type }
      else
        format.html { render :new }
        format.json { render json: @incident_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incident_types/1
  # PATCH/PUT /incident_types/1.json
  def update
    respond_to do |format|
      if @incident_type.update(incident_type_params)
        format.html { redirect_to @incident_type, notice: 'Incident type was successfully updated.' }
        format.json { render :show, status: :ok, location: @incident_type }
      else
        format.html { render :edit }
        format.json { render json: @incident_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incident_types/1
  # DELETE /incident_types/1.json
  def destroy
    @incident_type.destroy
    respond_to do |format|
      format.html { redirect_to incident_types_url, notice: 'Incident type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_incident_type
      @incident_type = IncidentType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_type_params
      params.require(:incident_type).permit(:name, :description, :meta).tap do |h|
        h[:meta] = YAML.load(h[:meta]) if h[:meta]
      end
    end
end
