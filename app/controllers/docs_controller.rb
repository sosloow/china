class DocsController < ApplicationController
  def index
    @docs = Document.all
  end
end
