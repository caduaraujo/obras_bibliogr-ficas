class V1::AuthorsController < ApplicationController
  def create
    byebug
    formatted_name = AuthorNameFormatter.new(permitted_params['author']).formatted_name
    Author.create(full_name: @formatted_name) unless Author.exists?(full_name: formatted_name)

    render status: :created, json: formatted_name.to_json
  rescue StandardError => e
    render status: :internal_server_error, json: 'There was a problem, try later'
  end

  private

  def permitted_params
    params.permit(:author)
  end
end
