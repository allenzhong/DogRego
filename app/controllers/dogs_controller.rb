class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy, :register]
  # GET /dogs
  # GET /dogs.json
  def index
    @dogs = Dog.users_dogs(current_user)
  end

  # GET /dogs/1
  # GET /dogs/1.json
  def show
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit
  end

  # POST /dogs
  # POST /dogs.json
  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    respond_to do |format|
      if @dog.save
        format.html { redirect_to @dog, notice: 'Dog was successfully created.' }
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dogs/1
  # PATCH/PUT /dogs/1.json
  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to @dog, notice: notice_info }
        format.json { render :show, status: :ok, location: @dog }
      else
        format.html { render :edit }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dogs/1
  # DELETE /dogs/1.json
  def destroy
    @dog.destroy
    respond_to do |format|
      format.html { redirect_to dogs_url, notice: 'Dog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def register    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_params
      params.require(:dog).permit(:name, :breed, :date_of_birth_on, :user_id,
        ownership_registration_attributes: [:id, :duration, :dog_id])
    end

    def notice_info
      if params && params[:dog][:ownership_registration_attributes]
        @dog.send_ownership_registeration()
        notice_content @dog
      else
        "Your dog's details updated."
      end
    end

    def notice_content(dog)
      return <<~TEMPLATE
        #{dog.name} is now registered for #{dog.ownership_registration.duration.humanize.downcase} (#{dog.ownership_registration.start_on.strftime("%d/%m/%Y")}-#{dog.ownership_registration.will_end_on.strftime("%d/%m/%Y")}). \
        You are required to pay #{AppConfig.durations[@dog.ownership_registration.duration]} into bank account 12-1234-1234-01
      TEMPLATE
    end
end
