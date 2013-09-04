class AddressesController < ApplicationController

  before_filter :get_agent

  def index
    @addresses = @agent.addresses.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @addresses }
    end
  end

  def show
    @address = @agent.addresses.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @address }
    end
  end

  def new
    @address = @agent.addresses.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @address }
    end
  end

  def edit
    @address = @agent.addresses.find(params[:id])
  end

  def create
    @address = @agent.addresses.new(params[:address])

    respond_to do |format|
      if @address.save
        format.html { redirect_to agent_address_path(@agent, @address), notice: 'Address was successfully created.' }
        format.json { render json: @address, status: :created, location: @address }
      else
        format.html { render action: new_agent_address_path(@agent, @address) }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @address = @agent.addresses.find(params[:id])

    respond_to do |format|
      if @address.update_attributes(params[:address])
        format.html { redirect_to agent_address_path(@agent, @address), notice: 'Address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address = @agent.addresses.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to agent_addresses_url(@agent) }
      format.json { head :no_content }
    end
  end

  def set_default
    address = @agent.addresses.find(params[:id])
    @agent.addresses.remove_primary
    address.update_attributes(is_default: true)
    redirect_to agent_addresses_path(@agent), notice: 'Set default address successfully.'
  end

  private

  def get_agent
    @agent = Agent.find(params[:agent_id])
  end

end
