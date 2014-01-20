class DocsController < ApplicationController
  def index
    @docs = Document.all
    @order = Order.new
  end
end
