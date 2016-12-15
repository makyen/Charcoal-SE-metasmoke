class FlagSettingsController < ApplicationController
  before_action :set_flag_setting, only: [:show, :edit, :update, :destroy]
  before_action :verify_admin, :except => [:index]

  # GET /flag_settings
  # GET /flag_settings.json
  def index
    @flag_settings = FlagSetting.all
  end

  # GET /flag_settings/new
  def new
    @flag_setting = FlagSetting.new
  end

  # GET /flag_settings/1/edit
  def edit
  end

  # POST /flag_settings
  # POST /flag_settings.json
  def create
    @flag_setting = FlagSetting.new(flag_setting_params)

    respond_to do |format|
      if @flag_setting.save
        format.html { redirect_to @flag_setting, notice: 'Flag setting was successfully created.' }
        format.json { render :show, status: :created, location: @flag_setting }
      else
        format.html { render :new }
        format.json { render json: @flag_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flag_settings/1
  # PATCH/PUT /flag_settings/1.json
  def update
    respond_to do |format|
      if @flag_setting.update(flag_setting_params)
        format.html { redirect_to @flag_setting, notice: 'Flag setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @flag_setting }
      else
        format.html { render :edit }
        format.json { render json: @flag_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flag_setting
      @flag_setting = FlagSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flag_setting_params
      params.require(:flag_setting).permit(:name, :value)
    end
end
