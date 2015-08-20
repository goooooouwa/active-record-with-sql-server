class EventFacebookPagesController < ApplicationController
  before_action :set_event_facebook_page, only: [:show, :edit, :update, :destroy]

  # GET /event_facebook_pages
  # GET /event_facebook_pages.json
  def index
    @event_facebook_pages = EventFacebookPage.all
  end

  # GET /event_facebook_pages/1
  # GET /event_facebook_pages/1.json
  def show
  end

  # GET /event_facebook_pages/new
  def new
    @event_facebook_page = EventFacebookPage.new
  end

  # GET /event_facebook_pages/1/edit
  def edit
  end

  # POST /event_facebook_pages
  # POST /event_facebook_pages.json
  def create
    @event_facebook_page = EventFacebookPage.new(event_facebook_page_params)

    respond_to do |format|
      if @event_facebook_page.save
        format.html { redirect_to @event_facebook_page, notice: 'Event facebook page was successfully created.' }
        format.json { render :show, status: :created, location: @event_facebook_page }
      else
        format.html { render :new }
        format.json { render json: @event_facebook_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_facebook_pages/1
  # PATCH/PUT /event_facebook_pages/1.json
  def update
    respond_to do |format|
      if @event_facebook_page.update(event_facebook_page_params)
        format.html { redirect_to @event_facebook_page, notice: 'Event facebook page was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_facebook_page }
      else
        format.html { render :edit }
        format.json { render json: @event_facebook_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_facebook_pages/1
  # DELETE /event_facebook_pages/1.json
  def destroy
    @event_facebook_page.destroy
    respond_to do |format|
      format.html { redirect_to event_facebook_pages_url, notice: 'Event facebook page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_facebook_page
      @event_facebook_page = EventFacebookPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_facebook_page_params
      params.require(:event_facebook_page).permit(:evnt_id, :facebook_page_id, :created_dt)
    end
end
