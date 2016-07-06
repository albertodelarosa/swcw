require 'rails_helper'

RSpec.describe Dashboard::AppointmentsController, type: :controller do

  let!(:appointment_tomorrow) { FactoryGirl.create(:appointment) }
  let!(:appointment_today)    { FactoryGirl.create(:appointment, date: (DateTime.now.to_date).to_s(:db), drop_off_time: '09:00:00', pick_up_time: '14:00:00') }
  let!(:appointment_last_week){ FactoryGirl.create(:appointment, date: (Time.current.to_date - 7.day).to_s(:db), drop_off_time: '09:00:00', pick_up_time: '14:00:00') }

  context "Happy Path" do
    before(:each) { login_user }

    describe "GET index" do
        subject { get :index }
        before(:each) { subject }

        it "assigns all current_user appointments as @appointments" do
          @user.appointments << appointment_tomorrow
          expect(assigns(:appointments)).to include(appointment_tomorrow)
        end
        it{ expect(assigns(:appointments)).to eq([]) }
      end

      describe "GET show" do
        subject { get :show, {id: appointment_tomorrow.id} }
        before(:each) { subject }

        it{ expect(assigns(:appointment)).to eq(appointment_tomorrow) }
      end

      describe "GET new" do
        subject { get :new }
        before(:each){subject}

        it{ expect( assigns(:appointment) ).to be_a_new(Appointment) }
        it "removes all past appointments" do
          today = FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date + 16.hour).to_s(:db))
          tomorrow = FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date + 1.day + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date + 1.day + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date + 1.day + 16.hour).to_s(:db))
          last_week = FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date - 7.day + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date - 7.day + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date - 7.day + 16.hour).to_s(:db))
          get_current_appointments_eval = controller.instance_eval{ get_current_appointments([today, tomorrow, last_week]) }

          expect( get_current_appointments_eval ).to include(today, tomorrow)
          expect( get_current_appointments_eval ).to_not include(last_week)
        end
        it "returns all current appointments" do
          today = FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date + 16.hour).to_s(:db))
          tomorrow = FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date + 1.day + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date + 1.day + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date + 1.day + 16.hour).to_s(:db))
          last_week = FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date - 7.day + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date - 7.day + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date - 7.day + 16.hour).to_s(:db))
          get_current_appointments_eval = controller.instance_eval{ get_current_appointments([today, tomorrow, last_week]) }
          current_appointments = controller.instance_variable_set(:@current_appointments, get_current_appointments_eval)

          expect( current_appointments ).to include(today, tomorrow)
          expect( current_appointments ).to_not include(last_week)
        end
        it "returns all current appointments" do
          today = FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date + 16.hour).to_s(:db))
          tomorrow = FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date + 1.day + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date + 1.day + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date + 1.day + 16.hour).to_s(:db))
          last_week = FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date - 7.day + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date - 7.day + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date - 7.day + 16.hour).to_s(:db))
          get_current_appointments_eval = controller.instance_eval{ get_current_appointments([today, tomorrow, last_week]) }
          current_appointments = controller.instance_variable_set(:@current_appointments, get_current_appointments_eval)
          past_appointments = controller.instance_variable_set(:@past_appointments, [today, tomorrow, last_week] - current_appointments)

          expect( past_appointments ).to include(last_week)
          expect( past_appointments ).to_not include(today, tomorrow)
        end
      end

    describe "POST create" do
      before { post :create, appointment: appointment_tomorrow }
      it "does something" do
        expect( assigns( :appointment ) ).to eq( appointment_tomorrow )
        expect( assigns( :appointment ) ).to eq( Appointment )
      end
    end
  end

end

#describe Dashboard::AppointmentsController do

  #let!(:appointment_tomorrow) { FactoryGirl.create(:appointment) }
  #let!(:appointment_today)    { FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date + 16.hour).to_s(:db)) }
  #let!(:appointment_last_week){ FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date - 7.day + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date - 7.day + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date - 7.day + 16.hour).to_s(:db)) }

  #context "Happy Path" do
    #describe "User signed in" do
      #before(:each) { login_user }

      #describe "GET index" do
        #subject { get :index }
        #before(:each) { subject }

        #it "assigns all current_user appointments as @appointments" do
          #@user.appointments << appointment_tomorrow
          #expect(assigns(:appointments)).to include(appointment_tomorrow)
        #end
        #it{ expect(assigns(:appointments)).to eq([]) }
      #end

      #describe "GET show" do
        #subject { get :show, {id: appointment_tomorrow.id} }
        #before(:each) { subject }

        #it{ expect(assigns(:appointment)).to eq(appointment_tomorrow) }
      #end

      #describe "GET new" do
        #subject { get :new }
        #before(:each){subject}

        #it{ expect( assigns(:appointment) ).to be_a_new(Appointment) }
        #it "removes all past appointments" do
          #today = FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date + 16.hour).to_s(:db))
          #tomorrow = FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date + 1.day + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date + 1.day + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date + 1.day + 16.hour).to_s(:db))
          #last_week = FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date - 7.day + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date - 7.day + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date - 7.day + 16.hour).to_s(:db))
          #get_current_appointments_eval = controller.instance_eval{ get_current_appointments([today, tomorrow, last_week]) }

          #expect( get_current_appointments_eval ).to include(today, tomorrow)
          #expect( get_current_appointments_eval ).to_not include(last_week)
        #end
        #it "returns all current appointments" do
          #today = FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date + 16.hour).to_s(:db))
          #tomorrow = FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date + 1.day + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date + 1.day + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date + 1.day + 16.hour).to_s(:db))
          #last_week = FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date - 7.day + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date - 7.day + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date - 7.day + 16.hour).to_s(:db))
          #get_current_appointments_eval = controller.instance_eval{ get_current_appointments([today, tomorrow, last_week]) }
          #current_appointments = controller.instance_variable_set(:@current_appointments, get_current_appointments_eval)

          #expect( current_appointments ).to include(today, tomorrow)
          #expect( current_appointments ).to_not include(last_week)
        #end
        #it "returns all current appointments" do
          #today = FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date + 16.hour).to_s(:db))
          #tomorrow = FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date + 1.day + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date + 1.day + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date + 1.day + 16.hour).to_s(:db))
          #last_week = FactoryGirl.create(:appointment, appointment_date: (Time.current.to_date - 7.day + 10.hour).to_s(:db), drop_off_time: (Time.current.to_date - 7.day + 10.hour).to_s(:db), pick_up_time: (Time.current.to_date - 7.day + 16.hour).to_s(:db))
          #get_current_appointments_eval = controller.instance_eval{ get_current_appointments([today, tomorrow, last_week]) }
          #current_appointments = controller.instance_variable_set(:@current_appointments, get_current_appointments_eval)
          #past_appointments = controller.instance_variable_set(:@past_appointments, [today, tomorrow, last_week] - current_appointments)

          #expect( past_appointments ).to include(last_week)
          #expect( past_appointments ).to_not include(today, tomorrow)
        #end
      #end

      ##describe "GET edit" do
        ##subject { get :edit, {:id => appointment_tomorrow.id} }
        ##before(:each) { subject }

        ##it "assigns the requested dashboard_appointment as @dashboard_appointment" do
          ##expect(assigns(:appointment)).to eq(appointment)
        ##end
      ##end

      #describe "POST create" do
        #describe "with valid params" do
          #subject {post :create}
          #before(:each){subject}

          #it "creates a new Dashboard::Appointment" do
            #expect {
              #assigns(:appointment)
            #}.to change(Appointment, :count).by(1)
          #end

          #it "assigns a newly created dashboard_appointment as @dashboard_appointment" do
            #post :create, {:dashboard_appointment => valid_attributes}, valid_session
            #assigns(:dashboard_appointment).should be_a(Dashboard::Appointment)
            #assigns(:dashboard_appointment).should be_persisted
          #end

          #it "redirects to the created dashboard_appointment" do
            #post :create, {:dashboard_appointment => valid_attributes}, valid_session
            #response.should redirect_to(Dashboard::Appointment.last)
          #end
        #end

        ##describe "with invalid params" do
          ##it "assigns a newly created but unsaved dashboard_appointment as @dashboard_appointment" do
            ### Trigger the behavior that occurs when invalid params are submitted
            ##Dashboard::Appointment.any_instance.stub(:save).and_return(false)
            ##post :create, {:dashboard_appointment => {  }}, valid_session
            ##assigns(:dashboard_appointment).should be_a_new(Dashboard::Appointment)
          ##end

          ##it "re-renders the 'new' template" do
            ### Trigger the behavior that occurs when invalid params are submitted
            ##Dashboard::Appointment.any_instance.stub(:save).and_return(false)
            ##post :create, {:dashboard_appointment => {  }}, valid_session
            ##response.should render_template("new")
          ##end
        ##end
      #end

      ##describe "PUT update" do
        ##describe "with valid params" do
          ##it "updates the requested dashboard_appointment" do
            ##appointment = Dashboard::Appointment.create! valid_attributes
            ### Assuming there are no other dashboard_appointments in the database, this
            ### specifies that the Dashboard::Appointment created on the previous line
            ### receives the :update_attributes message with whatever params are
            ### submitted in the request.
            ##Dashboard::Appointment.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
            ##put :update, {:id => appointment.to_param, :dashboard_appointment => { "these" => "params" }}, valid_session
          ##end

          ##it "assigns the requested dashboard_appointment as @dashboard_appointment" do
            ##appointment = Dashboard::Appointment.create! valid_attributes
            ##put :update, {:id => appointment.to_param, :dashboard_appointment => valid_attributes}, valid_session
            ##assigns(:dashboard_appointment).should eq(appointment)
          ##end

          ##it "redirects to the dashboard_appointment" do
            ##appointment = Dashboard::Appointment.create! valid_attributes
            ##put :update, {:id => appointment.to_param, :dashboard_appointment => valid_attributes}, valid_session
            ##response.should redirect_to(appointment)
          ##end
        ##end

        ##describe "with invalid params" do
          ##it "assigns the dashboard_appointment as @dashboard_appointment" do
            ##appointment = Dashboard::Appointment.create! valid_attributes
            ### Trigger the behavior that occurs when invalid params are submitted
            ##Dashboard::Appointment.any_instance.stub(:save).and_return(false)
            ##put :update, {:id => appointment.to_param, :dashboard_appointment => {  }}, valid_session
            ##assigns(:dashboard_appointment).should eq(appointment)
          ##end

          ##it "re-renders the 'edit' template" do
            ##appointment = Dashboard::Appointment.create! valid_attributes
            ### Trigger the behavior that occurs when invalid params are submitted
            ##Dashboard::Appointment.any_instance.stub(:save).and_return(false)
            ##put :update, {:id => appointment.to_param, :dashboard_appointment => {  }}, valid_session
            ##response.should render_template("edit")
          ##end
        ##end
      ##end

      ##describe "DELETE destroy" do
        ##it "destroys the requested dashboard_appointment" do
          ##appointment = Dashboard::Appointment.create! valid_attributes
          ##expect {
            ##delete :destroy, {:id => appointment.to_param}, valid_session
          ##}.to change(Dashboard::Appointment, :count).by(-1)
        ##end

        ##it "redirects to the dashboard_appointments list" do
          ##appointment = Dashboard::Appointment.create! valid_attributes
          ##delete :destroy, {:id => appointment.to_param}, valid_session
          ##response.should redirect_to(dashboard_appointments_url)
        ##end
      ##end
    #end
  #end
#end

