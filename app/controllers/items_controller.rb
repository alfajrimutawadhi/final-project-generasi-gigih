# frozen_string_literal: true

class ItemsController < ApplicationController # rubocop:disable Style/Documentation
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  before_action :set_item, only: %i[show update destroy]


  def render_404
    render json: { error: 'Item not found' }, status: 404
  end

  # GET /items
  # GET /items.json
  def index
    @items = Item.all.as_json
    render json: @items
  end

  # GET /items/1
  # GET /items/1.json
  def show
    item_category = ItemCategory.where(item_id: params[:id])
    render json: @item.as_json.merge(categories: Category.where(id: item_category.pluck(:category_id)).as_json)
  end

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
      validation_error('Category not found')
    else
      @item = Item.new(item_params)
      if @item.save
        json_params['categories'].each do |category|
          ItemCategory.create(item_id: @item.id,category_id: category)
        end
        response_success('Item created')
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    begin
      json_params = JSON.parse(request.raw_post)
      check_category = Category.find(json_params['categories'])
    rescue ActiveRecord::RecordNotFound
      check_category = nil
    end
    
    if check_category.nil?
      validation_error('Category not found')
    else
      if @item.update(item_params)
        find_category = ItemCategory.where(item_id: @item.id)
        find_category.destroy_all
        json_params['categories'].each do |category|
          ItemCategory.create(item_id: @item.id, category_id: category)
        end
        response_success('Item updated')
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    find_category = ItemCategory.where(item_id: @item.id)
    find_category.destroy_all
    @item.destroy
    response_success('Item deleted')
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
