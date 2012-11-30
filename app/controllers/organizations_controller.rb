class OrganizationsController < ApplicationController

  # GET /o
  # GET /o.json
  def index
    @organizations = Organization.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organizations }
    end
  end

  # GET /o/1
  # GET /o/1.json
  def show
    @organization = Organization.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @organization }
    end
  end

  # GET /o/new
  # GET /o/new.json
  def new
    @organization = Organization.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organization }
    end
  end

  # GET /o/1/edit
  def edit
    @organization = Organization.find(params[:id])
  end

  # POST /o
  # POST /o.json
  def create
    @organization = Organization.new(params[:organization])

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render json: @organization, status: :created, location: @organization }
      else
        format.html { render action: "new" }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /o/1
  # PUT /o/1.json
  def update
    @organization = Organization.find(params[:id])

    respond_to do |format|
      if @organization.update_attributes(params[:organization])
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /o/1
  # DELETE /o/1.json
  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to organizations_url }
      format.json { head :no_content }
    end
  end

  # POST /o/1/join
  # POST /o/1/join.json
  def join
    @organization = Organization.find(params[:id])

    respond_to do |format|
      if current_user.join(@organization)
        format.html { redirect_to @organization, notice: 'Organization was successfully joined.' }
        format.json { render json: @organization, status: :joined, location: @organization }
      else
        format.html { redirect_to @organization, notice: 'Organization was not successfully joined.' }
        format.json { render json: @organization, status: :unprocessable_entity }
      end
    end
  end

  # POST /o/1/leave
  # POST /o/1/leave.json
  def leave
    @organization = Organization.find(params[:id])

    respond_to do |format|
      if current_user.leave(@organization)
        format.html { redirect_to @organization, notice: 'Organization was successfully left.' }
        format.json { render json: @organization, status: :leaveed, location: @organization }
      else
        format.html { redirect_to @organization, notice: 'Organization was not successfully left.' }
        format.json { render json: @organization, status: :unprocessable_entity }
      end
    end
  end

  # POST /o/1/watch
  # POST /o/1/watch.json
  def watch
    @organization = Organization.find(params[:id])

    respond_to do |format|
      if current_user.watch(@organization)
        format.html { redirect_to @organization, notice: 'Organization was successfully watched.' }
        format.json { render json: @organization, status: :watched, location: @organization }
      else
        format.html { redirect_to @organization, notice: 'Organization was not successfully watched.' }
        format.json { render json: @organization, status: :unprocessable_entity }
      end
    end
  end

  # POST /o/1/unwatch
  # POST /o/1/unwatch.json
  def unwatch
    @organization = Organization.find(params[:id])

    respond_to do |format|
      if current_user.unwatch(@organization)
        format.html { redirect_to @organization, notice: 'Organization was successfully unwatched.' }
        format.json { render json: @organization, status: :unwatched, location: @organization }
      else
        format.html { redirect_to @organization, notice: 'Organization was not successfully unwatched.' }
        format.json { render json: @organization, status: :unprocessable_entity }
      end
    end
  end

  # POST /o/1/star
  # POST /o/1/star.json
  def star
    @organization = Organization.find(params[:id])

    respond_to do |format|
      if current_user.star(@organization)
        format.html { redirect_to @organization, notice: 'Organization was successfully starred.' }
        format.json { render json: @organization, status: :starred, location: @organization }
      else
        format.html { redirect_to @organization, notice: 'Organization was not successfully starred.' }
        format.json { render json: @organization, status: :unprocessable_entity }
      end
    end
  end

  # POST /o/1/unstar
  # POST /o/1/unstar.json
  def unstar
    @organization = Organization.find(params[:id])

    respond_to do |format|
      if current_user.unstar(@organization)
        format.html { redirect_to @organization, notice: 'Organization was successfully unstarred.' }
        format.json { render json: @organization, status: :unstarred, location: @organization }
      else
        format.html { redirect_to @organization, notice: 'Organization was not successfully unstarred.' }
        format.json { render json: @organization, status: :unprocessable_entity }
      end
    end
  end

end
