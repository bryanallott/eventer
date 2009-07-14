class NestedClientsController < ApplicationController
  before_filter :find_client

private
  def find_client
    @client = Client.find(params[:client_id])
  end
end
