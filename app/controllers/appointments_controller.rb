class AppointmentsController < ApplicationController
  before_action :check_user
  load_and_authorize_resource

  # GET /appointments
  def index
    if patient_signed_in?
      @appointments = Appointment.find_in_appointments('Patient', current_patient.id)
    else
      @appointments = Appointment.find_in_appointments('Doctor', current_doctor.id)
    end
  end

  # GET /appointments/1
  def show
    #@appointment = Appointment.find(appointment_params)
  end

  # GET /appointments/new
  def new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  def create
    @appointment.patient_id = current_patient.id
    if(Appointment.where(doctor_id: @appointment.doctor_id, recom: nil).count < 10)
    respond_to do |format|
        if @appointment.save
          format.html { redirect_to @appointment, notice: "Appointment was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    else
      #format.html { redirect_to root_path, notice: "Nothing happened:(" }
      flash[:notice] = "This Doctor have maximum appointments!"
      redirect_to root_path
    end
  end

  # PATCH/PUT /appointments/1
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: "Appointment was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: "Appointment was successfully destroyed." }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:subject, :doctor_id, :patient_id, :recom)
    end

    def check_user
      if current_doctor
        :authenticate_doctor!
      elsif current_patient
        :authenticate_patient!
      end
    end
end