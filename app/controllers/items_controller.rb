# frozen_string_literal: true

class ItemsController < ApplicationController # rubocop:disable Style/Documentation
  before_action :set_item, only: %i[show update destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show; end

  # POST /items
  # POST /items.json
  def create # rubocop:disable Metrics/MethodLength
    begin
      json_params = JSON.parse(request.raw_post)
      check_category = Category.find(json_params['categories'])
    rescue ActiveRecord::RecordNotFound
      check_category = nil
    end

    if check_category.nil?
      validation_error('category not found')
    else
      @item = Item.create(name: json_params['name'], description: json_params['description'], price: json_params['price'])
      json_params['categories'].each do |category|
        ItemCategory.create(item_id: @item.id,category_id: category)
      end
      @item.id.nil? ? validation_error('Item duplicate') : response_success('Item created')
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    if @item.update(item_params)
      render :show, status: :ok, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :description, :price)
  end
end
