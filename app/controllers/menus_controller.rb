class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :update, :destroy]

  # GET /menus
  def index
    @menus = Menu.all
    json_response(@menus)
  end

  # POST /menus
  def create
    @menu = Menu.create!(menu_params)
    json_response(@menu, :created)
  end

  # GET /menus/:id
  def show
    json_response(@menu)
  end

  # PUT /menus/:id
  def update
    @menu.update(menu_params)
    # create a HTTP response 200 (success) with an empty body, returning this response header
    head :no_content
  end

  def destroy
    @menu.destroy
    # create a HTTP response 200 (success) with an empty body, returning this response header
    head :no_content
  end

  private

  def menu_params
    params.permit(:title)
  end

  def set_menu
    @menu = Menu.find[params[:id]]
  end
end
