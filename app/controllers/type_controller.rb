class TypeController < ApplicationController
  def index
    @types = Type.all
  end

  def new
    @types = Type.new
  end

  def create
    Type.create(params.require(:types).permit(:type))
  end
end
