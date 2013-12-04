module Katello
  class ActivationKeysController < ApplicationController
    # GET /activation_keys
    # GET /activation_keys.json
    def index
      @activation_keys = ActivationKey.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @activation_keys }
      end
    end

    # GET /activation_keys/1
    # GET /activation_keys/1.json
    def show
      @activation_key = ActivationKey.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @activation_key }
      end
    end

    # GET /activation_keys/new
    # GET /activation_keys/new.json
    def new
      @activation_key = ActivationKey.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @activation_key }
      end
    end

    # GET /activation_keys/1/edit
    def edit
      @activation_key = ActivationKey.find(params[:id])
    end

    # POST /activation_keys
    # POST /activation_keys.json
    def create
      @activation_key = ActivationKey.new(params[:activation_key])

      respond_to do |format|
        if @activation_key.save
          format.html { redirect_to @activation_key, notice: 'Activation key was successfully created.' }
          format.json { render json: @activation_key, status: :created, location: @activation_key }
        else
          format.html { render action: "new" }
          format.json { render json: @activation_key.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /activation_keys/1
    # PUT /activation_keys/1.json
    def update
      @activation_key = ActivationKey.find(params[:id])

      respond_to do |format|
        if @activation_key.update_attributes(params[:activation_key])
          format.html { redirect_to @activation_key, notice: 'Activation key was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @activation_key.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /activation_keys/1
    # DELETE /activation_keys/1.json
    def destroy
      @activation_key = ActivationKey.find(params[:id])
      @activation_key.destroy

      respond_to do |format|
        format.html { redirect_to activation_keys_url }
        format.json { head :no_content }
      end
    end
  end
end
