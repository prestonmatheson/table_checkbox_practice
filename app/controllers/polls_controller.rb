class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /polls
  # GET /polls.json
  def index
    @polls = Poll.all
  end

  def add_polls
    render partial: 'table.js.erb', locals: { polls: Poll.all }
  end

  # GET /polls/1
  # GET /polls/1.json
  def show
  end

  # GET /polls/new
  def new
    @poll = Poll.new
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = Poll.new(poll_params)

    respond_to do |format|
      if @poll.save
        format.html { redirect_to @poll, notice: 'Poll was successfully created.' }
        format.json { render :show, status: :created, location: @poll }
        format.js
      else
        format.html { render :new }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /polls/1
  # PATCH/PUT /polls/1.json
  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll, notice: 'Poll was successfully updated.' }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url, notice: 'Poll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def selected_polls
    byebug
    redirect_to show_selected_polls_path(:poll_ids => params[:poll_ids])
  end

  def show_selected_polls
    @polls = Poll.all_selected(params[:poll_ids])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:title, :first_name, :last_name, :content)
    end
end
